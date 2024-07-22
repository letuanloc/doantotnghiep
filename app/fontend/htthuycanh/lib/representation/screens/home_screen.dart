import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/core/const/color_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htthuycanh/core/const/font_const.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container.dart';
import 'package:htthuycanh/temphumi/dht.dart';
import 'package:htthuycanh/temphumi/sensor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Sensor _sensorData = Sensor(Dht(null, null, null, null));
  double? apiValue1;
  double? apiValue2;
  double? apiValue3;
  double? apiValue4;

  Widget _buildItemCategory( Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
               ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              title,
            style: Constants.thirdTextStyle,
          )
        ],
      )
    );
  }

  void fetchData() async {
    await fetchApi1();
    await fetchApi2();
    await fetchApi3();
    await fetchApi4();
  }

  Future<void> fetchApi1() async {
    try {
      final response = await http.get(Uri.parse('http://159.223.77.123/get/TEY8OO5iafAV96gRKcZohbO6ED/V8/'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is num) {
          setState(() {
            apiValue1 = jsonData.toDouble(); // Chuyển đổi giá trị sang kiểu double nếu cần
          });
        } else {
          print('Error: Expected a number but got ${jsonData.runtimeType}');
        }
      } else {
        print('Error: Failed to fetch data from API 1');
      }
    } catch (e) {
      print('Error fetching API 1: $e');
    }
  }

  Future<void> fetchApi2() async {
    try {
      final response = await http.get(Uri.parse('http://159.223.77.123/get/TEY8OO5iafAV96gRKcZohbO6ED/V9/'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is num) {
          setState(() {
            apiValue2 = jsonData.toDouble(); // Chuyển đổi giá trị sang kiểu double nếu cần
          });
        } else {
          print('Error: Expected a number but got ${jsonData.runtimeType}');
        }
      } else {
        print('Error: Failed to fetch data from API 2');
      }
    } catch (e) {
      print('Error fetching API 2: $e');
    }
  }

  Future<void> fetchApi3() async {
    try {
      final response = await http.get(Uri.parse('http://159.223.77.123/get/TEY8OO5iafAV96gRKcZohbO6ED/V7/'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is num) {
          setState(() {
            apiValue3 = jsonData.toDouble(); // Chuyển đổi giá trị sang kiểu double nếu cần
          });
        } else {
          print('Error: Expected a number but got ${jsonData.runtimeType}');
        }
      } else {
        print('Error: Failed to fetch data from API 3');
      }
    } catch (e) {
      print('Error fetching API 3: $e');
    }
  }

  Future<void> fetchApi4() async {
    try {
      final response = await http.get(Uri.parse('http://159.223.77.123/get/TEY8OO5iafAV96gRKcZohbO6ED/V4/'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is num) {
          setState(() {
            apiValue4 = jsonData.toDouble(); // Chuyển đổi giá trị sang kiểu double nếu cần
          });
        } else {
          print('Error: Expected a number but got ${jsonData.runtimeType}');
        }
      } else {
        print('Error: Failed to fetch data from API 4');
      }
    } catch (e) {
      print('Error fetching API 4: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
              Text(
                  'IoTHydro',
                  style: GoogleFonts.megrim(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  )
                )
          ]
        ),
          ],
      )
    ),
      child:  Column(
          children: [
            SizedBox(
              height: 20,
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: ColorPalette.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(15)),
                          Text(
                            ' NHIỆT ĐỘ\nKHÔNG KHÍ',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white54),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          apiValue1 == null
                              ? CircularProgressIndicator()
                              : Text(
                            ' $apiValue1\u2103',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: ColorPalette.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(15)),
                          Text(
                            'NHIỆT ĐỘ\n   NƯỚC',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white54),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          apiValue2 == null
                              ? CircularProgressIndicator()
                              : Text(
                            ' $apiValue2\u2103',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
      ),

            SizedBox(
              height: 50,
            ),
             Row(
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: ColorPalette.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(15)),
                          Text(
                            'ĐỘ ẨM',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white54),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          apiValue3 == null
                              ? CircularProgressIndicator()
                              : Text(
                            ' $apiValue3%',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: ColorPalette.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(15)),
                          Text(
                            'ĐỘ SÁNG',
                            style: TextStyle(
                                fontSize: 15, color: Colors.white54),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          apiValue4 == null
                              ? CircularProgressIndicator()
                              : Text(
                            ' $apiValue4%',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
    ),
    );
  }
}

