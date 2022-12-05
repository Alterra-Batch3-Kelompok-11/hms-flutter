import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/auth_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<AuthModel> login(
      {required String username, required String password}) async {
    await dotenv.load(fileName: "assets/.env_development");
    try {
      var response = await _dio.post("${dotenv.env['API_KEY']}/login", data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {}
      final AuthModel authModel = AuthModel.fromJson(response.data['data']);
      print(authModel.token);
      print(authModel.name);
      return authModel;
    } on Dio {
      rethrow;
    }
  }
}
