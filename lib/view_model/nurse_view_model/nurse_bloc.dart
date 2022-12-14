import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/models/nurse_model.dart';
import 'package:hospital_management_system/models/schedule_model.dart';
import 'package:hospital_management_system/services/local_service.dart';
import 'package:hospital_management_system/services/nurse_service.dart';

part 'nurse_event.dart';
part 'nurse_state.dart';

class NurseBloc extends Bloc<NurseEvent, NurseState> {
  final NurseService _nurseService;
  final LocalService _localService;
  NurseBloc(this._nurseService, this._localService) : super(NurseInitial()) {
    on<GetProfileNurse>((event, emit) async {
      emit(NurseLoading());
      final bool expiredToken =
          await _localService.checkExpiredTokenFromLocal();
      if (expiredToken == false) {
        try {
          final AuthModel? dataAuth = await _localService.getDataFromLocal();
          final dataNurse =
              await _nurseService.getNurseProfile(nurseId: dataAuth!.nurseId!);

          final doctorSchedule = await _nurseService.getScheduleByDoctorId(
              doctorId: dataAuth.doctorId!);

          emit(ProfileNurseLoaded(
              dataNurse: dataNurse, schedule: doctorSchedule));
        } catch (e) {
          if (e is DioError) {
            print(e.response);
            emit(NurseError(message: e.response!.data['message']));
          } else {
            print(e.toString());
            emit(NurseError(message: e.toString()));
          }
        }
      } else {
        print("TOKEN EXPIRED");
        emit(const ExpiredNurseToken(message: "Expired token"));
      }
    });
  }
}
