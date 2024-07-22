#include <WiFi.h>
#include <WebSocketsClient.h>
#include <Arduino.h>
#include <ArduinoJson.h>
#include <Wire.h>
#include <U8g2lib.h>
#include <DHT.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <arduino-timer.h>
#include <HTTPClient.h>
#include <AceButton.h>
#include <DHT_U.h>

using namespace ace_button;

auto timer = timer_create_default();

// Thông số WiFi
const char* ssid = "iPhone của Lộc";
const char* password = "123456789";

// Thông số IP và port
const char* serverIP = "159.223.77.123";
unsigned int port = 80;

WiFiClient wifiClient;
WebSocketsClient webSocket;

bool isConnected = false;


#define VPIN_RELAY1 "V1"
#define VPIN_RELAY2 "V2"
#define VPIN_RELAY3 "V3"

#define sensor_hum "V7"
#define sensor_temp "V8"
#define sensor_temp_water "V9"
#define sensor_light "V4"

// Định nghĩa các chân relay
#define RelayPin1 23
#define RelayPin2 19
#define RelayPin3 18


// Định nghĩa các chân button
#define SwitchPin1 34
#define SwitchPin2 35
#define SwitchPin3 13


#define DHTTYPE DHT22
#define DHTPIN 32
//#define WATER_SENSOR_PIN 33
#define LIGHT_SENSOR_PIN 33
#define ONE_WIRE_BUS 26

// Khai báo đối tượng DHT
DHT dht(DHTPIN, DHTTYPE);

// Khai báo đối tượng OneWire và DallasTemperature
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

ButtonConfig config1;AceButton button1(&config1);
ButtonConfig config2;AceButton button2(&config2);
ButtonConfig config3;AceButton button3(&config3);
bool status[10];

U8G2_SSD1306_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/U8X8_PIN_NONE);

// Biến đếm số lần đọc cảm biến
int readCount = 0;
float accumulatedTemperature = 0;
float accumulatedHumidity = 0;
//float accumulatedWaterLevel = 0;
float accumulatedLightLevel = 0;
float accumulatedDallasTemp = 0;
//float accumulatedPhValue = 0;

bool relay3Status = false;

void button1Handler(AceButton* button, uint8_t eventType, uint8_t buttonState);
void button2Handler(AceButton* button, uint8_t eventType, uint8_t buttonState);
void button3Handler(AceButton* button, uint8_t eventType, uint8_t buttonState);

void handleWebSocketMessage(uint8_t* payload, size_t length) {
  String message = String((char*)payload);
    if (message.startsWith("{\"V")) {
      DynamicJsonDocument doc(1024);
      deserializeJson(doc, message);
      if (doc.containsKey(VPIN_RELAY1)) {
        int relayValue = doc[VPIN_RELAY1].as<int>();
        digitalWrite(RelayPin1, relayValue);
        Serial.printf("Relay 1 status: %d\n", relayValue);
        Serial.print(relayValue);
      }
      if (doc.containsKey(VPIN_RELAY2)) {
        int relayValue = doc[VPIN_RELAY2].as<int>();
        digitalWrite(RelayPin2, relayValue);
        Serial.printf("Relay 2 status: %d\n", relayValue);
        Serial.print(relayValue);
      }
      if (doc.containsKey(VPIN_RELAY3)) {
        int relayValue = doc[VPIN_RELAY3].as<int>();
        digitalWrite(RelayPin3, relayValue);
        Serial.printf("Relay 3 status: %d\n", relayValue);
        Serial.print(relayValue);
      }

    }
}

void webSocketEvent(WStype_t type, uint8_t* payload, size_t length) {
  switch (type) {
    case WStype_DISCONNECTED:
      Serial.println("WebSocket disconnected");
      isConnected = false;
      break;
    case WStype_CONNECTED:
      Serial.println("WebSocket connected");
      isConnected = true;
      break;
    case WStype_TEXT:
      Serial.printf("Received message: %s\n", payload);
      handleWebSocketMessage(payload, length);
      break;
    default:
      break;
  }
}

void setup() {
  Serial.begin(115200);
  delay(100);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);
  dht.begin();
  sensors.begin();
  u8g2.begin();

  while (WiFi.status() != WL_CONNECTED) {
    delay(250);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");

  webSocket.begin(serverIP, port, "/ws/update_relay/");
  webSocket.onEvent(webSocketEvent);

  pinMode(RelayPin1, OUTPUT);
  pinMode(RelayPin2, OUTPUT);
  pinMode(RelayPin3, OUTPUT);
  pinMode(SwitchPin1, INPUT_PULLUP);
  pinMode(SwitchPin2, INPUT_PULLUP);
  pinMode(SwitchPin3, INPUT_PULLUP);
  config1.setEventHandler(button1Handler);
  config2.setEventHandler(button2Handler);
  config3.setEventHandler(button3Handler);
  button1.init(SwitchPin1);
  button2.init(SwitchPin2);
  button3.init(SwitchPin3);

  digitalWrite(RelayPin1, HIGH);
  digitalWrite(RelayPin2, HIGH);

  timer.every(5000, readSensors, nullptr);
}

void loop() {
   if (!isConnected) {
    Serial.println("Attempting to reconnect WebSocket...");
  }
  webSocket.loop();

  button1.check();
  button2.check();
  button3.check();
  timer.tick();
}
bool readSensors(void* arg) {
  sensors.requestTemperatures();
  float dallasTemp = sensors.getTempCByIndex(0);
  int lightLevel = analogRead(LIGHT_SENSOR_PIN);
  float lightPercentage = ((float)(lightLevel - 4095) / (180 - 4095)) * 100;
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  updateSensorValues(t, h, dallasTemp, lightPercentage);
  accumulatedTemperature += t;
  accumulatedHumidity += h;
  accumulatedLightLevel += lightLevel;
  accumulatedDallasTemp += dallasTemp;
  readCount++;

   if (readCount == 10 || readCount == 1) {
u8g2.clearBuffer();
    u8g2.setFont(u8g2_font_ncenB08_tr);
    u8g2.drawStr(2, 10, "Do An Thuy Canh: ");
    u8g2.setCursor(6222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222224, 10);
    u8g2.drawStr(2, 30, "Temp: ");
    u8g2.setCursor(60, 30);
    u8g2.print(t);
    u8g2.println(" °C"); // \xb0 là mã ký tự độ
    u8g2.drawStr(2, 40, "Hum: ");
    u8g2.setCursor(60, 40);
    u8g2.print(h);
    u8g2.println(" %");
    // u8g2.drawStr(2, 30, "Avg Water: ");
    // u8g2.setCursor(60, 30);
    // u8g2.print(waterLevelPercent);
    u8g2.drawStr(2, 50, "Light: ");
    u8g2.setCursor(60, 50);
    u8g2.print(lightPercentage);
    u8g2.println(" %");
    u8g2.drawStr(2, 60, "Water: ");
    u8g2.setCursor(60, 60);
    u8g2.print(dallasTemp);
    u8g2.println(" °C"); // \xb0 là mã ký tự độ
    u8g2.sendBuffer();




  // Kiểm tra độ sáng và bật relay 3 nếu cần
 if (lightPercentage < 35.0) { // Kiểm tra xem độ sáng có dưới 35% không
    if (!relay3Status) {
        digitalWrite(RelayPin3, HIGH);
        relay3Status = true;
        Serial.println("Relay 3 turned ON due to low light level");
    }
}

// Bỏ phần tắt relay khi độ sáng đủ

return true;
}

    readCount = 0;
    accumulatedTemperature = 0;
    accumulatedHumidity = 0;
    //accumulatedWaterLevel = 0;
    accumulatedLightLevel = 0;
    accumulatedDallasTemp = 0;
    //accumulatedPhValue = 0;
  
  return true;
}

void updateSensorValues(float t, float h, float dallasTemp, float lightPercentage) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
String url = String("http://") + serverIP + ":" + String(port) + "/update_multi/?V7=" + String(h) + "&V8=" + String(t) + "&V9=" + String(dallasTemp) + "&V4=" + String(lightPercentage);
    http.begin(url);
    int httpResponseCode = http.GET();
    if (httpResponseCode > 0) {
      Serial.printf("HTTP Response code: %d\n", httpResponseCode);
    } else {
      Serial.println("Error on HTTP request, code: " + String(httpResponseCode));
    }
    http.end();
  } else {
    Serial.println("WiFi Disconnected");
  }
}

void button1Handler(AceButton* button, uint8_t eventType, uint8_t buttonState) {
  Serial.println("EVENT1");
  switch (eventType) {
    case AceButton::kEventReleased:
      {
        int value = 0;
        if (digitalRead(RelayPin1) == 1) {
          digitalWrite(RelayPin1, LOW);
        } else {
          digitalWrite(RelayPin1, HIGH);
          value = 1;
        }
        status[1] = (value == 1) ? true : false;
        Serial.println(value);
        break;
      }
  }
}
void button2Handler(AceButton* button, uint8_t eventType, uint8_t buttonState) {
  Serial.println("EVENT2");
  switch (eventType) {
    case AceButton::kEventReleased:
      {
        int value = 0;
        if (digitalRead(RelayPin2) == 1) {
          digitalWrite(RelayPin2, LOW);
        } else {
          digitalWrite(RelayPin2, HIGH);
          value = 1;
        }
        status[2] = (value == 1) ? true : false;
        Serial.println(value);
        break;
      }
  }
}
void button3Handler(AceButton* button, uint8_t eventType, uint8_t buttonState) {
  Serial.println("EVENT3");
  switch (eventType) {
    case AceButton::kEventReleased:
      {
        int value = 0;
        if (digitalRead(RelayPin3) == 1) {
          digitalWrite(RelayPin3, LOW);
        } else {
          digitalWrite(RelayPin3, HIGH);
          value = 1;
        }
        status[3] = (value == 1) ? true : false;
        relay3Status = (value == 1) ? true : false;
        Serial.println(value);
        break;
      }
  }
}