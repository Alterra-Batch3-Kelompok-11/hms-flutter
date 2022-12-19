import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/services/doctor_service.dart';
import 'package:hospital_management_system/services/local_service.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService _doctorService;
  final LocalService _localService;
  DoctorBloc(this._doctorService, this._localService) : super(DoctorInitial()) {
    on<GetProfileDoctor>((event, emit) async {
      emit(LoadingDoctor());
      final bool expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          AuthModel? dataAuth = await _localService.getDataFromLocal();

          if (dataAuth.doctorId != null || dataAuth.doctorId != 0) {
            DoctorModel doctor =
                await _doctorService.getProfileDoctor(id: dataAuth.doctorId!);
            emit(ProfileDoctorLoaded(doctorModel: doctor));
          } else {
            throw Exception;
          }
        } catch (e) {
          if (e is DioError) {
            emit(ErrorDoctor(message: e.response!.data['message']));
            print("DIO ERROR : " + e.response!.data['message']);
          } else {
            print("ERROR : " + e.toString());
            emit(ErrorDoctor(message: e.toString()));
          }
        }
      } else {
        emit(const ExpiredTokenDoctor(message: "Expired token"));
      }
    });

    on<GetScheduleAllDoctor>((event, emit) async {
      emit(LoadingDoctor());
      final bool expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      if (expiredToken == false) {
        try {
          final result = await _doctorService.getDoctorSchedule();

          emit(ScheduleAllDoctorLoaded(doctorList: result));
        } catch (e) {
          if (e is DioError) {
            emit(ErrorDoctor(message: e.response!.data['message']));
          } else {
            emit(ErrorDoctor(message: e.toString()));
          }
        }
      } else {
        emit(const ExpiredTokenDoctor(message: "Expired token"));
      }
    });
  }
}
