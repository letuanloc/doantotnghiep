
import 'package:flutter/material.dart';
import 'package:htthuycanh/representation/screens/plash_screen.dart';
import 'package:htthuycanh/representation/screens/home_screen.dart';
import 'package:htthuycanh/representation/screens/main_app.dart';
import 'package:htthuycanh/representation/screens/search_screen.dart';
import 'package:htthuycanh/representation/screens/control.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_info.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_systems.dart';
import 'package:htthuycanh/representation/screens/search_2_screen/hydro_process.dart';


final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    ControlScreen.routeName: (context) => const ControlScreen(),
    MainApp.routeName: (context) => const MainApp(),
    SearchScreen.routeName: (context) => const SearchScreen(),
    HydroInfoScreen.routeName: (context) => const HydroInfoScreen(),
    HydroSystemsScreen.routeName: (context) => const HydroSystemsScreen(),
    HydroProcessScreen.routeName: (context) => const HydroProcessScreen(),
};