import 'dart:io';

abstract class BaseApiService{
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> postApiResponse(String url, dynamic data);
  Future<dynamic> postWithFiles(String url, dynamic data, Map<String,File> files);
}