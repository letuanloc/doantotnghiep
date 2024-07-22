import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container.dart';
import 'package:http/http.dart' as http;

class ControlScreen extends StatefulWidget{
  const ControlScreen({Key? key}) : super(key: key);
  static String routeName = 'control_screen';

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen>{
  int lightValue = 0;
  int pump1Value = 0;
  int pump2Value = 0;

  void _toggleLight() async {
    try {
      var url = Uri.parse('http://159.223.77.123/update/TEY8OO5iafAV96gRKcZohbO6ED/V3/?value=${lightValue == 0 ? '1' : '0'}');

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        setState(() {
          lightValue = lightValue == 0 ? 1 : 0; // Cập nhật giá trị trạng thái của đèn
        });
        print('Light toggled successfully');
      } else {
        print('Failed to toggle light. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _togglePump1() async {
    try {
      var url = Uri.parse('http://159.223.77.123/update/TEY8OO5iafAV96gRKcZohbO6ED/V1/?value=${pump1Value == 0 ? '1' : '0'}');

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        setState(() {
          pump1Value = pump1Value == 0 ? 1 : 0;
        });
        print('Pump1 toggled successfully');
      } else {
        print('Failed to toggle pump1. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _togglePump2() async {
    try {
      var url = Uri.parse('http://159.223.77.123/update/TEY8OO5iafAV96gRKcZohbO6ED/V2/?value=${pump2Value == 0 ? '1' : '0'}');

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        setState(() {
          pump2Value = pump2Value == 0 ? 1 : 0; // Cập nhật giá trị trạng thái của đèn
        });
        print('Pump2 toggled successfully');
      } else {
        print('Failed to toggle pump2. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        titleString: 'BẢNG ĐIỀU KHIỂN',
        //implementLeading: true,
        child:  Column(
          children: [
          SizedBox(
          height: 150,
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'MÁY BƠM 1',
                 style: TextStyle(fontSize: 24),
                 textAlign: TextAlign.left,
               ),

               ElevatedButton(
                 onPressed: _togglePump1,
                 child: Text('${pump1Value == 1 ? 'ON' : 'OFF'}',
                   textAlign: TextAlign.right,
                 ),
               ),
             ],
           ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MÁY BƠM 2',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),

                ElevatedButton(
                  onPressed: _togglePump2,
                  child: Text('${pump2Value == 1 ? 'ON' : 'OFF'}',
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  'BÓNG ĐÈN',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                ElevatedButton(
                  onPressed: _toggleLight,
                  child: Text('${lightValue == 1 ? 'ON' : 'OFF'}',
                    textAlign: TextAlign.right,
                  ),
                ),

              ],
            )
      ]
        )

    );
  }
}