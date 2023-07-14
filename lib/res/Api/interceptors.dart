import 'package:dio/dio.dart';
import 'package:tetranos_template/data/local/shared_preference_manager.dart';

import '../../dependency_injection/di.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = sl.get<SharedPreferenceManager>().getAccessToken();
    options.headers['Authorization'] = 'Bearer $accessToken';
    print('>>>>>>>>>>added accessToken from interceptor: $accessToken');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}