import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_model.dart';

class LocalService {
  late SharedPreferences _preferences;

  Future<void> saveDataToLocal(AuthModel authModel, bool isRemember) async {
    _preferences = await SharedPreferences.getInstance();

    await _preferences.setInt("user_id", authModel.userId);
    await _preferences.setString("name", authModel.name);
    await _preferences.setInt("role_id", authModel.roleId);
    await _preferences.setString("token", authModel.token);
    await _preferences.setInt("doctor_id", authModel.doctorId ?? 0);
    await _preferences.setInt("nurse_id", authModel.nurseId ?? 0);

    await _preferences.setString("username", authModel.username);
    await _preferences.setBool("is_remember", isRemember);
  }

  Future<AuthModel> getDataFromLocal() async {
    _preferences = await SharedPreferences.getInstance();
    return AuthModel.fromLocal(_preferences);
  }

  Future<void> clearDataFromLocal() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

  Future<void> setDataLocalIfLogout() async {
    _preferences = await SharedPreferences.getInstance();
    final bool? isRemember = _preferences.getBool("is_remember");
    if (isRemember == true) {
      await _preferences.remove("token");
      await _preferences.remove("name");
      await _preferences.remove("role_id");
      await _preferences.remove("user_id");
      await _preferences.remove("doctor_id");
      await _preferences.remove("nurse_id");
    } else {
      await _preferences.clear();
    }
  }

  Future<int> getRoleIdFromLocal() async {
    _preferences = await SharedPreferences.getInstance();

    final int? roleId = _preferences.getInt("role_id");
    return roleId!;
  }

  Future<bool> checkRememberMeFromLocal() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool("is_remember") ?? false;
  }

  Future<String?> getTokenFromLocal() async {
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

  Future<bool> checkExpiredTokenFromLocal() async {
    final String? token = await getTokenFromLocal();

    if (token != null || token!.isNotEmpty) {
      bool tokenExpired = Jwt.isExpired(token);

      print("TOKEN EXPIRED $tokenExpired");
      if (tokenExpired == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> removeTokenFromLocal() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove("token");
  }
}
