import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/services/doctor_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService _doctorService;
  late SharedPreferences _sharedPreferences;
  DoctorBloc(this._doctorService) : super(DoctorInitial()) {
    on<GetProfileDoctor>((event, emit) async {
      _sharedPreferences = await SharedPreferences.getInstance();
      emit(LoadingDoctor());

      try {
        final int? id = _sharedPreferences.getInt("id");
        print("ID DOCTOR : $id");

        DoctorModel doctor = await _doctorService.getProfileDoctor(id: id!);
        emit(ProfileDoctor(doctorModel: doctor));
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

    on<LoadDoctorBySchedule>((event, emit) async {
      emit(LoadingDoctor());

      try {
        final result = await _doctorService.getShceduleToday();
        emit(ListScheduleDoctorLoaded(doctorList: result));
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
