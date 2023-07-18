import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:tetranos_template/data/remote/exceptions/api_exceptions.dart';
import 'package:tetranos_template/data/remote/service/base_api_service.dart';
import 'package:tetranos_template/res/Api/api_client.dart';
import '../../../dependency_injection/di.dart';
import '../../local/shared_preference_manager.dart';

class ApiService extends BaseApiService{

  ApiClient apiClient = sl.get<ApiClient>();
  SharedPreferenceManager sharedPreferenceManager = sl.get<SharedPreferenceManager>();

  @override
  Future getApiResponse(String url, {bool? token}) async{
    dynamic responseJson;
    try{

      dynamic headers = token==null?{
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      }:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':"Bearer ${sharedPreferenceManager.getAccessToken()}"
      };
      final response = await get(Uri.parse(url), headers: headers);
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions(message: 'No Internet Connection');
    }
    catch(e){
      print(e);
      throw FetchDataExceptions(message: 'Error During Communication');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data, {bool? token}) async{

    dynamic responseJson;

    try{
      dynamic headers = token==null?{
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      }:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':"Bearer ${sharedPreferenceManager.getAccessToken()}"
      };

      final response = await post(Uri.parse(url), body: data, headers: headers).timeout(const Duration(seconds: 30));
      print(response.body);
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions(message: 'No Internet Connection');
    }
    on FormatException{
      throw FetchDataExceptions(message: 'Format Exception');
    }
    catch(e){
      print(e);
      throw e;
    }
    return responseJson;
  }

  @override
  Future postWithFiles(String url, dynamic data, Map<String,File> files, {bool? token}) async {
    dynamic responseJson;
    try {
      dynamic headers = token==null?{
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      }:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':"Bearer ${sharedPreferenceManager.getAccessToken()}"
      };
      var request = MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(data);
      request.headers.addAll(headers);

      files.forEach((key, value) async{
        String fieldName = key; // Modify this according to your API's expected file field name
        String fileName = value.path.split('/').last;
        String mimeType = lookupMimeType(value.path)??"";


        var fileStream = ByteStream(Stream.castFrom(value.openRead()));
        var fileLength = await value.length();

        var multipartFile = MultipartFile(
          fieldName,
          fileStream,
          fileLength,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        );

        request.files.add(multipartFile);
      });



      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var statusCode = response.statusCode;

      responseJson = returnResponse(Response(responseBody, statusCode));
    } on SocketException {
      throw FetchDataExceptions(message: 'No Internet Connection');
    } catch (e) {
      throw FetchDataExceptions(message: 'Error During Communication');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataExceptions(message: "Error during connection");
    }
  }
  
}