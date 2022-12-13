import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/models/history_patiens_model.dart';
import 'package:hospital_management_system/models/history_patients_approval_model.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/models/patient_queue_model.dart';

class PatientService {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.env['BASE_URL'].toString();

  Future<List<OutpatientModel>> getOutpatientUnprocessed(
      {required int idDoctor, required String token}) async {
    try {
      //respons with token
      final response = await _dio.get(
          "$_baseUrl/outpatient_sessions/doctor/$idDoctor/unprocesseds",
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
  Future<List<OutpatientModel>?> getOutpatientApproveds(
      {required int idDoctor, required String token}) async {
    try {
      final response = await _dio.get(
          "$_baseUrl/outpatient_sessions/doctor/$idDoctor/approveds",
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

  //PUT APPROVAL
  Future<void> putOutpatientApproval(
      //  int isApproved,
      {required int idOutpatient,
      required String token,
      required int isApproved}) async {
    OutpatientModel updateOutpatient;
    try {
      final response = await _dio.put(
        "$_baseUrl/outpatient_sessions/$idOutpatient/approval",
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
      //print('INI RESPONSE PUT ${updateOutpatient.isApproved}');
    } on DioError {
      rethrow;
    }
  }

  Future<List<Historypatiens>> getHistoryVisit(
      {required int idDoctor, required String token}) async {
    try {
      //respons with token
      final response = await _dio.get(
          "$_baseUrl/histories/doctor/$idDoctor/outpatient_sessions",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));
      // print(" coba RESPONSE : " + response.data['data'].toString());
      final dataRespone =
          response.data['data'] != null ? response.data['data'] as List : [];
      List<Historypatiens> historyList = [];
      //List<OutpatientModel> historyList = [];
      for (var i = 0; i < dataRespone.length; i++) {
        // print("DATA RESPONSE : " + dataRespone[i].toString());
        historyList.add(Historypatiens.fromJson(dataRespone[i]));
      }
      print(" tess {$historyList}");
      return historyList;
    } on DioError {
      rethrow;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<Historypatiensapprovals>> GetHistoryApprovals(
      {required int idDoctor, required String token}) async {
    try {
      //respons with token
      final response =
          await _dio.get("$_baseUrl/histories/doctor/$idDoctor/approvals",
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ));
      print(" coba1 RESPONSE : " + response.data['data'].toString());
      final dataRespone =
          response.data['data'] != null ? response.data['data'] as List : [];
      List<Historypatiensapprovals> historyListApprovals = [];
      //List<OutpatientModel> historyList = [];
      for (var i = 0; i < dataRespone.length; i++) {
        print("DATA RESPONSE : " + dataRespone[i].toString());
        historyListApprovals
            .add(Historypatiensapprovals.fromJson(dataRespone[i]));
      }
      print(" tess {$historyListApprovals}");
      return historyListApprovals;
    } on DioError {
      rethrow;
    }
  }

  Future<PatientQueueToday> getPatientQueueToday(
      {required int idDokter, required String token}) async {
    try {
      final response = await _dio.get(
        "$_baseUrl/dashboard/mobile/doctor/$idDokter",
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

  Future<OutpatientModel> getDetailOutpatient(
      {required int id, required String token}) async {
    try {
      final response = await _dio.get(
        "$_baseUrl/outpatient_sessions/$id",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      return OutpatientModel.fromJson(response.data['data']);
    } on DioError {
      rethrow;
    }
  }

  Future<bool> insertConditionPatient(
      {required String allergy,
      required String condition,
      required String medicine,
      required int patientSessionId,
      required String token}) async {
    try {
      final response = await _dio.post(
        "$_baseUrl/patients_conditions",
        data: {
          "outpatient_session_id": patientSessionId,
          "description": condition,
          "medicine": medicine,
          "allergy": allergy,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      print("INSERT PATIENT CONDITION");

      print("RESPOSNE : ${response.data['data']}");
      if (response.statusCode == 200) {
        print("status : ${response.data['data']['status']}");
        return true;
      } else {
        print("status : ${response.data['data']['status']}");
        return false;
      }
    } on DioError {
      rethrow;
    }
  }
}
