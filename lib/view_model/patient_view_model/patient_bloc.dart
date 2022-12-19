import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/history_patiens_model.dart';
import 'package:hospital_management_system/models/history_patient_treatment_model.dart';
import 'package:hospital_management_system/models/insert_patient_condition_model.dart';
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
    /// AKAN DIHAPUS
    on<GetOutpatientUnprocessed>(
      (event, emit) async {
        emit(PatientLoading());
        final bool? expiredToken =
            await _localService.checkExpiredTokenFromLocal();
        if (expiredToken == false) {
          try {
            final AuthModel dataAuth = await _localService.getDataFromLocal();
            final int doctorId;
            if (dataAuth.doctorId == 0 || dataAuth.doctorId == null) {
              doctorId =
                  await _patientService.getDoctorIdFromNurse(dataAuth.nurseId!);
            } else {
              doctorId = dataAuth.doctorId!;
            }

            print("doctorId $doctorId");
            final List<OutpatientModel> outpatientList =
                await _patientService.getOutpatientUnprocessed(
                    idDoctor: doctorId, token: dataAuth.token);

            print("PERMINTAAN KUNJUNGAN");
            print(outpatientList);
            emit(OutpatientLoaded(outpatientList: outpatientList));
          } catch (e) {
            if (e is DioError) {
              final errorResponse = e.response;
              emit(PatientError(message: errorResponse!.data['message']));
              print("DIO ERROR : " + errorResponse.data['message']);
            }

            print("ERROR : " + e.toString());
            emit(PatientError(message: e.toString()));
          }
        } else {
          emit(const PatientExpiredToken(message: "Expired token"));
        }
      },
    );

    /// AKAN DIHAPUS
    // JADWAL KUNJUNGAN
    on<GetOutpatientApproveds>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();
      if (expiredToken == false) {
        try {
          final AuthModel dataAuth = await _localService.getDataFromLocal();
          final List<OutpatientModel>? outpatientList =
              await _patientService.getOutpatientApproveds(
                  idDoctor: dataAuth.doctorId!, token: dataAuth.token);

          emit(OutpatientLoaded(outpatientList: outpatientList ?? []));
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            print("ERROR : " + e.toString());
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<GetPatientQueueToday>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();
      if (expiredToken == false) {
        try {
          final AuthModel dataAuth = await _localService.getDataFromLocal();
          final int doctorId;

          if (dataAuth.doctorId == 0 || dataAuth.doctorId == null) {
            doctorId =
                await _patientService.getDoctorIdFromNurse(dataAuth.nurseId!);
          } else {
            doctorId = dataAuth.doctorId!;
          }
          PatientQueueToday response = await _patientService
              .getPatientQueueToday(idDokter: doctorId, token: dataAuth.token);

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
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    // APPROVAL KUNJUNGAN
    on<PutOutpatientApproval>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final AuthModel dataAuth = await _localService.getDataFromLocal();
          await _patientService.putOutpatientApproval(
              token: dataAuth.token,
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
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    /// AKAN DIHAPUS
    // on<GetHistoryVisit>((event, emit) async {
    //   emit(PatientLoading());
    //   final bool? expiredToken =
    //       await _localService.checkExpiredTokenFromLocal();

    //   if (expiredToken == false) {
    //     try {
    //       final AuthModel dataAuth = await _localService.getDataFromLocal();

    //       final List<Historypatiens> historyList =
    //           await _patientService.getHistoryVisit(
    //               idDoctor: dataAuth.doctorId!, token: dataAuth.token);

    //       emit(HistoryVisitLoaded(historyList: historyList));
    //     } catch (e) {
    //       if (e is DioError) {
    //         final errorResponse = e.response;
    //         emit(PatientError(message: errorResponse!.data['message']));

    //         print("DIO ERROR : " + errorResponse.data['message']);
    //       }

    //       print("ERROR : " + e.toString());
    //       emit(PatientError(message: e.toString()));
    //     }
    //   } else {
    //     emit(const PatientExpiredToken(message: "Expired Token"));
    //   }
    // });

    /// AKAN DIHAPUS
    // on<GetHistoryApprovals>((event, emit) async {
    //   emit(PatientLoading());
    //   final bool? expiredToken =
    //       await _localService.checkExpiredTokenFromLocal();

    //   if (expiredToken == false) {
    //     try {
    //       final AuthModel dataAuth = await _localService.getDataFromLocal();
    //       final List<Historypatiensapprovals> historyListApprovals =
    //           await _patientService.getHistoryApprovals(
    //               idDoctor: dataAuth.doctorId!, token: dataAuth.token);
    //       emit(HistoryApprovalsLoaded(
    //           historyListApprovals: historyListApprovals));
    //     } catch (e) {
    //       if (e is DioError) {
    //         final errorResponse = e.response;
    //         emit(PatientError(message: errorResponse!.data['message']));

    //         print("DIO ERROR : " + errorResponse.data['message']);
    //       } else {
    //         print("ERROR : " + e.toString());
    //         emit(PatientError(message: e.toString()));
    //       }
    //     }
    //   } else {
    //     emit(const PatientExpiredToken(message: "Expired Token"));
    //   }
    // });

    on<GetDetailOutpatient>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final String? token = await _localService.getTokenFromLocal();

          if (token != null || token!.isNotEmpty) {
            final response = await _patientService.getDetailOutpatient(
                id: event.outSessionId, token: token);
            final historyList = await _patientService
                .getHistoryPatientTreatment(event.patientId);

            emit(DetailOutpatientLoaded(
                outpatientModel: response, historyList: historyList));
          } else {
            emit(const PatientError(message: "Token is null"));
          }
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<InsertConditionPatient>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final String? token = await _localService.getTokenFromLocal();
          final InsertPatientConditionModel response =
              await _patientService.insertConditionPatient(
                  allergy: event.allergy,
                  condition: event.condition,
                  medicine: event.medicine,
                  patientSessionId: event.patientSessionId,
                  token: token!);

          emit(SuccessInsertCondition(
              outPatientSessionId: response.outPatientSessionId,
              outPatientId: response.patientId));
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
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<GetHistoryPatientTreatment>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final historyList =
              await _patientService.getHistoryPatientTreatment(event.patientId);
          emit(HistoryPatientTreatmentLoaded(historyList: historyList));
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            print(e.toString());
            emit(const PatientError(message: "Something wrong"));
          }
        }
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<GetNotification>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final String? token = await _localService.getTokenFromLocal();
          final historyList =
              await _patientService.getNotification(token: token!);

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
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<GetPatientSchedule>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final AuthModel dataAuth = await _localService.getDataFromLocal();
          final int doctorId;

          if (dataAuth.doctorId == 0 || dataAuth.doctorId == null) {
            doctorId =
                await _patientService.getDoctorIdFromNurse(dataAuth.nurseId!);
          } else {
            doctorId = dataAuth.doctorId!;
          }

          final List<OutpatientModel> listOutpatientUnprocessed =
              await _patientService.getOutpatientUnprocessed(
                  idDoctor: doctorId, token: dataAuth.token);
          final List<OutpatientModel> listOutpatientApproved =
              await _patientService.getOutpatientApproveds(
                  idDoctor: doctorId, token: dataAuth.token);

          emit(PatientScheduleLoaded(
              listOutpatientUnprocessed: listOutpatientUnprocessed,
              listOutpatientApproved: listOutpatientApproved));
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });

    on<GetPatientHistory>((event, emit) async {
      emit(PatientLoading());
      final bool? expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final AuthModel dataAuth = await _localService.getDataFromLocal();
          final int doctorId;

          if (dataAuth.doctorId == 0 || dataAuth.doctorId == null) {
            doctorId =
                await _patientService.getDoctorIdFromNurse(dataAuth.nurseId!);
          } else {
            doctorId = dataAuth.doctorId!;
          }

          print("DOCTOR ID FROM NURSE :$doctorId");
          print("DOCTOR ID FROM :${dataAuth.doctorId}");

          final List<Historypatiens> historyList = await _patientService
              .getHistoryVisit(idDoctor: doctorId, token: dataAuth.token);
          final List<Historypatiensapprovals> historyListApprovals =
              await _patientService.getHistoryApprovals(
                  idDoctor: doctorId, token: dataAuth.token);

          emit(PatientHistoryLoaded(
              historyListApprovals: historyListApprovals,
              historyList: historyList));
        } catch (e) {
          if (e is DioError) {
            emit(PatientError(message: e.response!.data['message']));
          } else {
            emit(PatientError(message: e.toString()));
          }
        }
      } else {
        emit(const PatientExpiredToken(message: "Expired Token"));
      }
    });
  }
}
