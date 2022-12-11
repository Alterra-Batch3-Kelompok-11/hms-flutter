import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();
  late SharedPreferences _preferences;

  Future<AuthModel> login(
      {required String username, required String password}) async {
    String baseUrl = dotenv.env['BASE_URL'].toString();
    try {
      var response = await _dio.post("$baseUrl/login", data: {
        "username": username,
        "password": password,
      });

      print(response.data['data']);
      final AuthModel authModel = AuthModel.fromJson(response.data['data']);
      print(authModel);
      return authModel;
    } on DioError {
      rethrow;
    }
  }

  Future<void> saveToLocal(AuthModel authModel, bool isRemember) async {
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

  Future<AuthModel> getStoragePreferences() async {
    _preferences = await SharedPreferences.getInstance();

    int userId = _preferences.getInt("user_id") ?? 0;
    String name = _preferences.getString("name") ?? "";
    String username = _preferences.getString("username") ?? "";
    int roleId = _preferences.getInt("role_id") ?? 0;
    String token = _preferences.getString("token") ?? "";
    int doctorId = _preferences.getInt("doctor_id") ?? 0;
    int nurseId = _preferences.getInt("nurse_id") ?? 0;
    AuthModel dataAuth = AuthModel(
      userId: userId,
      name: name,
      username: username,
      roleId: roleId,
      token: token,
      doctorId: doctorId,
      nurseId: nurseId,
    );

    return dataAuth;
  }
}
