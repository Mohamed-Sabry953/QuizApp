import 'package:shared_preferences/shared_preferences.dart';
class CacheData{
  static late SharedPreferences upgradeAcc;
  static bool? check;
  static Future<void> cacheInit() async {
    upgradeAcc= await SharedPreferences.getInstance();
  }
  static setUpgradeAccData({required String key,required bool value}) async {
    await upgradeAcc.setBool(key, value);
  }
  static bool? getUpgradeAccData({required String key}){
    check=upgradeAcc.getBool(key);
    return upgradeAcc.getBool(key);
  }
}