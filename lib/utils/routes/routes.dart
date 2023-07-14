
import 'package:flutter/material.dart';
import 'package:tetranos_template/utils/routes/route_names.dart';
import 'package:tetranos_template/views/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RouteNames.home_screen:
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_)=>const Scaffold(
          body: Center(
            child: Text("No Page Available"),
          ),
        ));
    }
  }
}