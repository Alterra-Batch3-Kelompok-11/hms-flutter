import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/services/local_service.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthService {
  final Dio _dio = Dio();
  // late SharedPreferences _preferences;

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

  Future<void> logout(LocalService localService) async {
    bool? isRemember = await localService.isRemember();
    localService.setDataIfLogout(isRemember);
  }

  Future<bool> isLogin(LocalService localService) async {
    String? token = await localService.getToken();
    if (token.isNotEmpty) {
      bool? expiredDateToken = Jwt.isExpired(token);
      print("EXPIRED TOKEN : $expiredDateToken");
      if (!expiredDateToken) {
        return true;
      } else {
        localService.removeToken();
        return false;
      }
    } else {
      return false;
    }
  }
}
