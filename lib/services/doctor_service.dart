import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/doctor_model.dart';

class DoctorService {
  final Dio _dio = Dio();

  Future<DoctorModel> getProfileDoctor({required int id}) async {
    String baseUrl = dotenv.env["BASE_URL"].toString();
    try {
      final response = await _dio.get("$baseUrl/doctors/$id");

      print("DATA DOCTOR");
      print(response.data['data']);
      return DoctorModel.fromJson(response.data['data']);
    } on DioError {
      rethrow;
    }
  }

  Future<List<DoctorModel>> getDoctorSchedule() async {
    String baseUrl = dotenv.env['BASE_URL'].toString();

    try {
      final response = await _dio.get("$baseUrl/doctors/today");

      if (response.data['data'] == null) {
        return [];
      } else {
        return (response.data['data'] as List)
            .map((data) => DoctorModel.fromJson(data))
            .toList();
      }
    } on DioError {
      rethrow;
    }
  }
}
