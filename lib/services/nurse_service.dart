import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/models/nurse_model.dart';
import 'package:hospital_management_system/models/schedule_model.dart';

class NurseService {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.env['BASE_URL'].toString();

  Future<NurseModel> getNurseProfile({required int nurseId}) async {
    try {
      final response = await _dio.get("$_baseUrl/nurses/$nurseId");

      if (response.statusCode == 200) {
        return NurseModel.fromJson(response.data['data']);
      } else {
        throw DioError;
      }
    } on DioError {
      rethrow;
    }
  }

  Future<List<ScheduleModel>> getScheduleByDoctorId(
      {required int doctorId}) async {
    try {
      final response = await _dio.get("$_baseUrl/doctors/$doctorId");
      final DoctorModel doctor;
      final List<ScheduleModel> doctorSchedule;

      if (response.statusCode == 200) {
        doctor = DoctorModel.fromJson(response.data['data']);
        if (doctor.doctorSchedules.isEmpty) {
          doctorSchedule = [];
        } else {
          doctorSchedule = doctor.doctorSchedules;
        }
        return doctorSchedule;
      } else {
        throw DioError;
      }
    } on DioError {
      rethrow;
    }
  }
}
