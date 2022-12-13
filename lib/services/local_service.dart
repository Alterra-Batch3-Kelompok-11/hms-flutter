import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_model.dart';

class LocalService {
  late SharedPreferences _preferences;

  Future<void> saveDataToLocalStorage(
      AuthModel authModel, bool isRemember) async {
    _preferences = await SharedPreferences.getInstance();

    await _preferences.setInt("user_id", authModel.userId);
    await _preferences.setString("name", authModel.name);
    await _preferences.setString("username", authModel.username);
    await _preferences.setInt("role_id", authModel.roleId);
    await _preferences.setString("token", authModel.token);
    await _preferences.setInt("doctor_id", authModel.doctorId ?? 0);
    await _preferences.setInt("nurse_id", authModel.nurseId ?? 0);
    await _preferences.setBool("is_remember", isRemember);
  }

  Future<AuthModel> getDataFromLocalStorage() async {
    _preferences = await SharedPreferences.getInstance();
    return AuthModel.fromLocal(_preferences);
  }

  Future<void> clearDataFromLocalStorage() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

  Future<void> setDataIfLogout(bool isRemember) async {
    _preferences = await SharedPreferences.getInstance();
    if (isRemember == true) {
      await _preferences.remove("token");
      await _preferences.remove("role_id");
      await _preferences.remove("id");
    } else {
      await _preferences.clear();
    }
  }

  Future<bool> isRemember() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool("is_remember") ?? false;
  }

  Future<String> getToken() async {
    _preferences = await SharedPreferences.getInstance();

    String? token = _preferences.getString("token");

    if (token != null) {
      bool isExpiredToken = Jwt.isExpired(token);

      if (isExpiredToken != true) {
        return token;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  Future<bool> checkExpiredToken() async {
    String token = await getToken();
    bool tokenExpired = Jwt.isExpired(token);

    if (tokenExpired == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> removeToken() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove("token");
  }
}
