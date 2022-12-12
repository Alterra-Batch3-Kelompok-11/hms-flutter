import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/models/patient_queue_model.dart';

class PatientService {
  final Dio _dio = Dio();

  Future<List<OutpatientModel>> getOutpatientUnprocessed(
      {required int idDoctor, required String token}) async {
    String baseUrl = dotenv.env["BASE_URL"].toString();
    try {
      //respons with token
      final response = await _dio.get(
          "$baseUrl/outpatient_sessions/doctor/$idDoctor/unprocesseds",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));
      print("RESPONSE : " + response.data['data'].toString());
      final dataRespone =
          response.data['data'] != null ? response.data['data'] as List : [];
      List<OutpatientModel> outpatientList = [];
      //List<OutpatientModel> outpatientList = [];
      for (var i = 0; i < dataRespone.length; i++) {
        print("DATA RESPONSE : " + dataRespone[i].toString());
        outpatientList.add(OutpatientModel.fromJson(dataRespone[i]));
      }
      return outpatientList;
    } on DioError {
      rethrow;
    }
  }

  //get outpatient processed by iddoctor
  Future<List<OutpatientModel>?> getOutpatientProcessed(
      {required int idDoctor, required String token}) async {
    String baseUrl = dotenv.env["BASE_URL"].toString();
    try {
      final response = await _dio.get(
          "$baseUrl/outpatient_sessions/doctor/$idDoctor/processeds",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));
      print('INI data Respone ${response.data['data']}');

      final dataRespone =
          response.data['data'] != null ? response.data['data'] as List : [];
      List<OutpatientModel> outpatientList = [];
      print('INI data Respone $dataRespone');

      for (var i = 0; i < dataRespone.length; i++) {
        outpatientList.add(OutpatientModel.fromJson(dataRespone[i]));
      }
      print('INI APAAA $outpatientList');
      return outpatientList;
    } on DioError {
      rethrow;
    }
  }

  //put outpatient unprocessed to processed
  Future<OutpatientModel?> putOutpatientApproval(
      {required int idOutpatient,
      required String token,
      // required OutpatientModel outpatient,
      required int isApproved}) async {
    OutpatientModel? updateOutpatient;
    String baseUrl = dotenv.env["BASE_URL"].toString();
    try {
      final response = await _dio.put(
        "$baseUrl/outpatient_sessions/$idOutpatient/approval",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "is_approved": isApproved,
        },
      );
      print('INI RESPONSE PUT ${response.data['data']}');

      updateOutpatient = OutpatientModel.fromJson(response.data['data']);
      return updateOutpatient;
    } on DioError {
      rethrow;
    }
  }

  Future<PatientQueueToday> getPatientQueueToday(
      {required int idDokter, required String token}) async {
    String baseUrl = dotenv.env['BASE_URL'].toString();
    try {
      final response = await _dio.get(
        "$baseUrl/dashboard/mobile/doctor/$idDokter",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("RESPONSE QUEUE PATIENT ${response.data['data']}");

      return PatientQueueToday.fromJson(response.data['data']);
    } on DioError {
      rethrow;
    }
  }
}
