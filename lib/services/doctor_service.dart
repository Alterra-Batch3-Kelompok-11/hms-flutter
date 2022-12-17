import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/doctor_model.dart';

class DoctorService {
  final Dio _dio = Dio();
  final String baseUrl = dotenv.env["BASE_URL"].toString();

  Future<DoctorModel> getProfileDoctor({required int id}) async {
    try {
      final response = await _dio.get("$baseUrl/doctors/$id");

      if (response.statusCode == 200) {
        print("DATA DOCTOR");
        print(response.data['data']);
        return DoctorModel.fromJson(response.data['data']);
      } else {
        throw DioError;
      }
    } on DioError {
      rethrow;
    }
  }

  Future<List<DoctorModel>> getDoctorSchedule() async {
    try {
      final response = await _dio.get("$baseUrl/doctors/today");

      if (response.statusCode == 200) {
        if (response.data['data'] == null) {
          return [];
        } else {
          return (response.data['data'] as List)
              .map((data) => DoctorModel.fromJson(data))
              .toList();
        }
      } else {
        throw DioError;
      }
    } on DioError {
      rethrow;
    }
  }
}
