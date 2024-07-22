import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/core/const/font_const.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_info.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_systems.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_process.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({Key? key}) : super(key: key);
  static String routeName = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{

  @override
  Widget build(BuildContext context){
    return AppBarContainerWidget(
      titleString: 'SỔ TAY THỦY CANH',
      //implementLeading: true,
      child:  Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row (
            children: [
              Expanded(
                child: Text(
                      'MỤC LỤC',
                      textAlign: TextAlign.center,
                      style: Constants.secondTextStyle,

                  ),
              ),
            ],
          ),
          SizedBox(
            height: 90,
          ),
          Row (
            children: [
              Expanded(
                child:
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HydroInfoScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                          '1. Giới thiệu về kỹ thuật thủy canh',
                          textAlign: TextAlign.left,
                          style: Constants.thirdTextStyle
                      ),
                    ),
                  ),
                ],
              ),
          SizedBox(
            height: 10,
          ),
          Row (
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HydroSystemsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                      '2. Phân loại các hệ thống thủy canh',
                      textAlign: TextAlign.left,
                      style: Constants.thirdTextStyle
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row (
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HydroProcessScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                      '3. Hướng dẫn kỹ thuật trồng rau thủy canh',
                      textAlign: TextAlign.left,
                      style: Constants.thirdTextStyle
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row (
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HydroProcessScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                      '4. Một số hệ thống thủy canh thông dụng hiện nay',
                      textAlign: TextAlign.left,
                      style: Constants.thirdTextStyle
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row (
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HydroInfoScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                      '5. Hướng dẫn sử dụng hệ thống IoTHydro',
                      textAlign: TextAlign.left,
                      style: Constants.thirdTextStyle
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}