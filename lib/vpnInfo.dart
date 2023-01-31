import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VpnInfo extends Model {
  String _school = "";
  String _publicIp = "";
  String _privateIp = "";
  String _heartTime = "";
  String _tokenName = "";
  String _tokenMsg = "";

  String get school => _school;
  String get publicIp => _publicIp;
  String get privateIp => _privateIp;
  String get heartTime => _heartTime;
  String get tokenName => _tokenName;
  String get tokenMsg => _tokenMsg;

  setValues() {
    print('set2!');
    SharedPreferences.getInstance().then((prefs) {
      _school = prefs.getString('school') ?? "";
      _publicIp = prefs.getString('publicIp') ?? "";
      _privateIp = prefs.getString('privateIp') ?? "";
      _heartTime = prefs.getString('heartTime') ?? "";
      _tokenName = prefs.getString('tokenName') ?? "";
      _tokenMsg = prefs.getString('tokenMsg') ?? "";
    });
    notifyListeners();
    print('notify2');
  }

  //

  void save(String str1, String str2, String str3, String str4, String str5, String str6) {
     _school = str1;
     _publicIp = str2;
     _privateIp = str3;
     _heartTime = str4;
     _tokenName = str5;
     _tokenMsg = str6;
    notifyListeners();
  }
}
