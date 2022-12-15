import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/history_patiens_model.dart';
import 'package:hospital_management_system/models/history_patient_treatment_model.dart';
import 'package:hospital_management_system/models/notification_model.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:hospital_management_system/models/patient_queue_model.dart';
import 'package:hospital_management_system/services/local_service.dart';
import 'package:hospital_management_system/services/patient_service.dart';

import '../../models/history_patients_approval_model.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientService _patientService;
  final LocalService _localService;

  PatientBloc(this._patientService, this._localService)
      : super(PatientInitial()) {
    on<GetOutpatientUnprocessed>(
      (event, emit) async {
        emit(PatientLoading());
        final AuthModel dataAuth =
            await _localService.getDataFromLocalStorage();
        try {
          final int? id = dataAuth.doctorId;
          final String? token = dataAuth.token;

          final List<OutpatientModel>? outpatientList = await _patientService
              .getOutpatientUnprocessed(idDoctor: 7, token: token!);

          print("PERMINTAAN KUNJUNGAN");
          print(outpatientList);
          emit(OutpatientLoaded(outpatientList: outpatientList ?? []));
        } catch (e) {
          if (e is DioError) {
            final errorResponse = e.response;
            emit(PatientError(message: errorResponse!.data['message']));
            print("DIO ERROR : " + errorResponse.data['message']);
          }

          print("ERROR : " + e.toString());
          emit(PatientError(message: e.toString()));
        }
      },
    );

    // JADWAL KUNJUNGAN
    on<GetOutpatientApproveds>((event, emit) async {
      emit(PatientLoading());
      final AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      try {
        final int? id = dataAuth.doctorId;
        final String? token = dataAuth.token;
        print("ID DOCTOR : $id");
        print("TOKEN : $token");

        final List<OutpatientModel>? outpatientList = await _patientService
            .getOutpatientApproveds(idDoctor: 7, token: token!);

        // }
        emit(OutpatientLoaded(outpatientList: outpatientList ?? []));
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(PatientError(message: errorResponse!.data['message']));

          print("DIO ERROR : " + errorResponse.data['message']);
        }

        print("ERROR : " + e.toString());
        emit(PatientError(message: e.toString()));
      }
    });

    on<GetPatientQueueToday>((event, emit) async {
      emit(PatientLoading());

      AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      try {
        PatientQueueToday response = await _patientService.getPatientQueueToday(
            idDokter: dataAuth.doctorId!, token: dataAuth.token);

        emit(PatientQueueTodayLoaded(patientQueueToday: response));
      } catch (e) {
        if (e is DioError) {
          print(e.response!.data['message']);
          emit(PatientError(message: e.response!.data['message']));
        } else {
          print(e.toString());
          emit(const PatientError(message: "Something Wrong"));
        }
      }
    });

    // APPROVAL KUNJUNGAN
    on<PutOutpatientApproval>((event, emit) async {
      emit(PatientLoading());
      final AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      try {
        final String? token = dataAuth.token;

        print("TOKEN : $token");

        await _patientService.putOutpatientApproval(
            token: token!,
            idOutpatient: event.idOutpatient,
            isApproved: event.isApproved);

        emit(OutpatientApprovalSuccess());
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(PatientError(message: errorResponse!.data['message']));
          print("DIO ERROR : " + errorResponse.data['message']);
        }
        print("ERROR : " + e.toString());
        emit(PatientError(message: e.toString()));
      }
    });

    on<GetHistoryVisit>((event, emit) async {
      emit(PatientLoading());
      final AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      try {
        final int? id = dataAuth.doctorId;
        final String? token = dataAuth.token;
        print("ID DOCTOR : $id");
        print("TOKEN : $token");

        final List<Historypatiens>? historyList =
            await _patientService.getHistoryVisit(idDoctor: id!, token: token!);

        // }
        print("tes $historyList");
        emit(HistoryVisitLoaded(historyList: historyList ?? []));
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(PatientError(message: errorResponse!.data['message']));

          print("DIO ERROR : " + errorResponse.data['message']);
        }

        print("ERROR : " + e.toString());
        emit(PatientError(message: e.toString()));
      }
    });

    on<GetHistoryApprovals>((event, emit) async {
      emit(PatientLoading());
      final AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      try {
        final int? id = dataAuth.doctorId;
        final String? token = dataAuth.token;
        print("ID DOCTOR : $id");
        print("TOKEN : $token");

        final List<Historypatiensapprovals>? historyListApprovals =
            await _patientService.getHistoryApprovals(
                idDoctor: id!, token: token!);

        print("tes $historyListApprovals");

        emit(HistoryApprovalsLoaded(
            historyListApprovals: historyListApprovals ?? []));
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(PatientError(message: errorResponse!.data['message']));

          print("DIO ERROR : " + errorResponse.data['message']);
        }

        print("ERROR : " + e.toString());
        emit(PatientError(message: e.toString()));
      }
    });

    on<GetDetailOutpatient>((event, emit) async {
      emit(PatientLoading());

      final String? token = await _localService.getToken();

      if (token != null || token!.isNotEmpty) {
        try {
          final response = await _patientService.getDetailOutpatient(
              id: event.outSessionId, token: token);

          final historyList =
              await _patientService.getHistoryPatientTreatment(event.patientId);

          emit(DetailOutpatientLoaded(
              outpatientModel: response, historyList: historyList));
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientError(message: "TOKEN EXPIRED"));
      }
    });

    on<InsertConditionPatient>((event, emit) async {
      emit(PatientLoading());
      final String? token = await _localService.getToken();

      if (token != null || token!.isNotEmpty) {
        try {
          final int outPatientSessionId =
              await _patientService.insertConditionPatient(
                  allergy: event.allergy,
                  condition: event.condition,
                  medicine: event.medicine,
                  patientSessionId: event.patientSessionId,
                  token: token);

          emit(
              SuccessInsertCondition(outPatientSessionId: outPatientSessionId));
        } catch (e) {
          if (e is DioError) {
            print(e.response!.data['message']);
            emit(PatientError(message: e.response!.data['message']));
          } else {
            print("ELSE " + e.toString());
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientError(message: "Expired token"));
      }
    });

    on<GetHistoryPatientTreatment>((event, emit) async {
      String? getToken = await _localService.getToken();

      if (getToken!.isNotEmpty) {
        try {
          final historyList =
              await _patientService.getHistoryPatientTreatment(event.patientId);

          print("HISTORY BLOC : " + historyList[0].complaint);
          emit(HistoryPatientTreatmentLoaded(historyList: historyList));
          if (historyList.isNotEmpty) {
          } else {
            throw DioError;
          }
        } catch (e) {
          if (e is DioError) {
            // print(
            //     "ERROR RESONSE FROM BLOC : ${e.response!.data['data']['message']}");
            emit(const PatientError(message: "Data not found"));
          } else {
            print(e.toString());
            emit(const PatientError(message: "Something wrong"));
          }
        }
      } else {
        emit(const PatientError(message: "Token expired"));
      }
    });

    on<GetNotification>((event, emit) async {
      emit(PatientLoading());
      final String? token = await _localService.getToken();
      if (token != null || token != "") {
        try {
          final historyList =
              await _patientService.getNotification(token: token!);

          print(historyList);
          emit(NotificationLoaded(notificationList: historyList));
        } catch (e) {
          if (e is DioError) {
            print(e.response!.data['message']);
            emit(PatientError(message: e.response!.data['message']));
          } else {
            print(e.toString());
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientError(message: "Token expired"));
      }
    });
  }
}
