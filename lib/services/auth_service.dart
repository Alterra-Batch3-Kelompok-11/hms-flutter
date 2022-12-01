import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<void> login(
      {required String username, required String password}) async {
    await dotenv.load(fileName: "assets/.env_development");

    print(dotenv.env['API_KEY']);
    try {
      var data = await _dio.post("${dotenv.env['API_KEY']}/login", data: {
        "username": username,
        "password": password,
      });
    } on Dio {
      rethrow;
    }
  }
}
