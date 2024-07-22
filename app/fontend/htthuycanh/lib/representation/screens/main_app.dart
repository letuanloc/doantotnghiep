import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:htthuycanh/core/const/color_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:htthuycanh/representation/screens/home_screen.dart';
import 'package:htthuycanh/representation/screens/search_screen.dart';
import 'package:htthuycanh/representation/screens/control.dart';

class MainApp extends StatefulWidget{
  const MainApp({Key? key}) : super(key: key);
  static String routeName = 'main_app';

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ColorPalette.thirdColor,
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
        HomeScreen(),
        ControlScreen(),
        SearchScreen(),
      ]
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.house),
              title: const Text('Trang chủ'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.gear),
              title: const Text('Bảng điều khiển'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.book),
              title: const Text('Sổ tay thủy canh'),
            ),
          ]
      ),
    );
  }
}