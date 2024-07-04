import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass extends ChangeNotifier {
  static const String accessTokenKey = "ACCESSTOKEN";
  static const String userUIDKey = "USERUID";
  static const String companyNameKey = "COMPANYNAMEKEY";

  String? _accessToken;
  String? _userUid;
  String? _companyName;

  String? get accessToken => _accessToken;
  String? get userUid => _userUid;
  String? get companyName => _companyName;

  Future<void> saveAccessTokenStatus(String accessToken) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(accessTokenKey, accessToken);
    _accessToken = accessToken;
    print("Save AccessToken: $accessToken");
    notifyListeners();
  }

  Future<void> saveUserIdStatus(String userUid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(userUIDKey, userUid);
    _userUid = userUid;
    notifyListeners();
  }

  Future<void> saveCompanyNameStatus(String companyName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(companyNameKey, companyName);
    _companyName = companyName;
    notifyListeners();
  }

  Future<void> getAccessTokenStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    _accessToken = sf.getString(accessTokenKey);
    print('token:$_accessToken');
    notifyListeners();
  }

  Future<void> getUserIdStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    _userUid = sf.getString(userUIDKey);
    notifyListeners();
  }

  Future<void> getCompanyNameStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    _companyName = sf.getString(companyNameKey);
    print('company name:$_companyName');
    notifyListeners();
  }
}
