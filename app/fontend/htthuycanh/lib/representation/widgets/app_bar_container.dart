import 'package:flutter/material.dart';
import 'package:htthuycanh/core/const/color_const.dart';
import 'package:htthuycanh/core/const/font_const.dart';

class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget(
      {
        Key?key,
        required this.child,
        this.title,
        this.titleString,
        //this.implementLeading = false
      }
      ) : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  //final bool implementLeading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
        children: [
          SizedBox(
            height: 100,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorPalette.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0)
                )
              ),
              title: title??
                  Row(
                    children: [
                      // if(implementLeading)
                      //   Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(
                      //           Radius.circular(
                      //             14,
                      //       )
                      //       ),
                      //       color: ColorPalette.primaryColor,
                      //     ),
                      //     padding: EdgeInsets.all(5),
                      //     child: Icon(
                      //       FontAwesomeIcons.arrowLeft,
                      //       color: Colors.white,
                      //       size: 20,
                      //     ),
                      //   ),
                      Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  titleString ?? '',
                                    style: Constants.primaryTextStyle
                                )
                              ],
                            )
                          )
                      )
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(),
                ]
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(
              left: 40.0,
              top: 140.0,
              right: 40.0,
              bottom: 0.0,
            ),
            child: child,
          )
    ]
      )
    );
  }
}