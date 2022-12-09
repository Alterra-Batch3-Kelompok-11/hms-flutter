import 'dart:convert';

import 'package:hospital_management_system/models/outpatient_model.dart';

//dio
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OutpatientService {
  final Dio _dio = Dio();
  //get outpatient unprocessed by iddoctor
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

      // List<OutpatientModel> outpatientList = [];
      // for (var i = 0; i < response.data.length; i++) {
      //   outpatientList.add(OutpatientModel.fromJson(response.data[i]));
      // }
      // print("OUTPATIENT LIST : " + outpatientList.toString());
      // return outpatientList;

      //  return OutpatientModel.fromJson(response.data['data']);
      // Iterable list = json.decode(response.data);

      // List<OutpatientModel> outpatientList = [];
      // outpatientList = list.map((e) => OutpatientModel.fromJson(e)).toList();
      // print("OUTPATIENT LIST : " + outpatientList.toString());
      // return outpatientList;

      // return response.data.map((e) => OutpatientModel.fromJson(e)).toList();
    } on DioError {
      rethrow;
    }
  }
}
