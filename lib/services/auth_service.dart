import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/auth_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<AuthModel> login(
      {required String username, required String password}) async {
    String baseUrl = dotenv.env['BASE_URL'].toString();
    try {
      var response = await _dio.post("$baseUrl/login", data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {}
      final AuthModel authModel = AuthModel.fromJson(response.data['data']);
      return authModel;
    } on DioError {
      rethrow;
    }
  }
}
