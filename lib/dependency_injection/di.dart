import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tetranos_template/data/remote/service/network_api_service.dart';
import 'package:tetranos_template/res/Api/api_client.dart';
import 'package:tetranos_template/res/constants.dart';
import 'package:tetranos_template/res/endpoints.dart';

import '../data/local/shared_preference_manager.dart';

final sl = GetIt.instance;

Future<void> setupDependency()async{
  sl.registerLazySingleton<AppConstants>(() => AppConstants());
  sl.registerLazySingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();
  sl.registerLazySingleton<SharedPreferenceManager>(() => SharedPreferenceManager());
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton<EndPoints>(() => EndPoints());
  sl.registerLazySingleton<ApiService>(() => ApiService());
}