import 'package:shared_preferences/shared_preferences.dart';

import '../../dependency_injection/di.dart';

class SharedPreferenceManager{
  String accessToken = "accessToken";
  final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();

  String? getAccessToken(){
    return sharedPreferences.getString(accessToken);
  }
  Future<bool> setAccessToken(String acToken)async{
    return await sharedPreferences.setString(accessToken, acToken);
  }
  Future<bool> removeAccessToken()async{
    return await sharedPreferences.remove(accessToken);
  }

}