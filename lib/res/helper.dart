import 'package:flutter/material.dart';

class Helper{
  late Size size;
  Helper(){
    size = WidgetsBinding.instance.window.physicalSize;
  }
}