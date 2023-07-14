import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tetranos_template/res/Api/interceptors.dart';

class ApiClient{

  final String rootUrl = 'https://jsonplaceholder.typicode.com/';

  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };




}