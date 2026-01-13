import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  String email = "";
  String uid = "";
  bool isLogin = false;

  Future<void> setSharedPreferedData(Map obj) async {
    SharedPreferences sharedPreferencesobj =
        await SharedPreferences.getInstance();
    sharedPreferencesobj.setString('email', obj['email']);
    sharedPreferencesobj.setString('uid', obj['uid']);
    sharedPreferencesobj.setBool('isLogin', obj['isLogin']);
  }

  Future<void> setRegisterBusiness(Map obj) async {
    SharedPreferences sharedPreferencesobj =
        await SharedPreferences.getInstance();
    sharedPreferencesobj.setBool(
      'isRegisterBusiness',
      obj['isRegisterBusiness'],
    );
  }

  Future<void> getSharePrefrenceData() async {
    SharedPreferences sharedPreferencesobj =
        await SharedPreferences.getInstance();
    email = sharedPreferencesobj.getString('email') ?? "";
    uid = sharedPreferencesobj.getString('uid') ?? "";
    isLogin = sharedPreferencesobj.getBool('isLogin') ?? false;
  }
}
