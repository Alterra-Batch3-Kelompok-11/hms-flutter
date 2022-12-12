import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/history_patiens_model.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
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
              .getOutpatientUnprocessed(idDoctor: id!, token: token!);
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
            .getOutpatientApproveds(idDoctor: id!, token: token!);

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

        final List<Historypatiensapprovals >? historyListApprovals =
            await _patientService.GetHistoryApprovals(idDoctor: id!, token: token!);

        // }
        print("tes $historyListApprovals");

        emit(HistoryApprovalsLoaded(historyListApprovals: historyListApprovals ?? []));
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
  }
}
