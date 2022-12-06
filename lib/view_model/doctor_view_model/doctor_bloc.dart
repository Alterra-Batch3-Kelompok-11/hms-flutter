import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/services/doctor_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorService doctorService;
  late SharedPreferences _sharedPreferences;
  DoctorBloc({required this.doctorService}) : super(DoctorInitial()) {
    on<GetProfileDoctor>((event, emit) async {
      emit(LoadingDoctor());

      _sharedPreferences = await SharedPreferences.getInstance();
      try {
        DoctorModel doctor = await doctorService.getProfileDoctor(id: 7);
        print("INI DARI BLOC : $doctor");
        emit(GetDoctorProfile(doctorModel: doctor));
      } catch (e) {
        if (e is DioError) {
          final errorResponse = e.response;
          emit(ErrorDoctorState(message: errorResponse!.data['message']));
        }
      }
    });
  }
}
