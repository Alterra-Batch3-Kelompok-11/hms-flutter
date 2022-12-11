import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:hospital_management_system/services/doctor_service.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService _doctorService;
  final AuthService _authService;
  DoctorBloc(this._doctorService, this._authService) : super(DoctorInitial()) {
    on<GetProfileDoctor>((event, emit) async {
      // _sharedPreferences = await SharedPreferences.getInstance();
      emit(LoadingDoctor());
      try {
        AuthModel dataAuth = await _authService.getStoragePreferences();
        final int? id = dataAuth.doctorId;
        print("ID DOCTOR : $id");

        DoctorModel doctor = await _doctorService.getProfileDoctor(id: id!);
        emit(ProfileDoctorLoaded(doctorModel: doctor));
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(ErrorDoctorState(message: errorResponse!.data['message']));

          print("DIO ERROR : " + errorResponse.data['message']);
        }
        print("ERROR : " + e.toString());
        emit(ErrorDoctorState(message: e.toString()));
      }
    });

    on<GetScheduleAllDoctor>((event, emit) async {
      emit(LoadingDoctor());

      try {
        final result = await _doctorService.getDoctorSchedule();
        emit(ScheduleAllDoctorLoaded(doctorList: result));
      } catch (e) {
        if (e is DioError) {
          emit(ErrorDoctorState(message: e.response!.data['message']));
        } else {
          emit(ErrorDoctorState(message: e.toString()));
        }
      }
    });
  }
}
