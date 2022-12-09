import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/outpatient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/outpatient_service.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final OutpatientService _outpatientService;
  late SharedPreferences _sharedPreferences;

  PatientBloc(this._outpatientService) : super(PatientInitial()) {
    on<GetOutpatientUnprocessed>(
      (event, emit) async {
        _sharedPreferences = await SharedPreferences.getInstance();
        emit(PatientLoading());
        try {
          final int? id = _sharedPreferences.getInt("id");
          final String? token = _sharedPreferences.getString("token");
          print("ID DOCTOR : $id");
          print("TOKEN : $token");

          final List<OutpatientModel> outpatientList = await _outpatientService
              .getOutpatientUnprocessed(idDoctor: id!, token: token!);
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
      },
    );

    on<GetOutpatientProcessed>((event, emit) async {
      _sharedPreferences = await SharedPreferences.getInstance();
      emit(PatientLoading());
      try {
        final int? id = _sharedPreferences.getInt("id");
        final String? token = _sharedPreferences.getString("token");
        print("ID DOCTOR : $id");
        print("TOKEN : $token");

        final List<OutpatientModel>? outpatientList = await _outpatientService
            .getOutpatientProcessed(idDoctor: id!, token: token!);
        // if (outpatientList == null || outpatientList.isEmpty) {
        //   emit(OutpatientLoaded(outpatientList: []));
        // } else {
        //   emit(OutpatientLoaded(outpatientList: outpatientList));
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
  }
}
