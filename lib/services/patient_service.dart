import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';

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
      final dataRespone = response.data['data'] as List;
      List<OutpatientModel> outpatientList = [];
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
}
