import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/core/const/color_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:htthuycanh/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key:key);
  static String routeName = '/plash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    redirectHomeScreen();
  }
  void redirectHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushNamed(MainApp.routeName);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Center(
        child: Text(
          'IoTHydro',
            style: GoogleFonts.megrim(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        )
      )

    );
  }
}