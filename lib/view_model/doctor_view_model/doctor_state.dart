part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class LoadingDoctor extends DoctorState {}

class ProfileDoctorLoaded extends DoctorState {
  final DoctorModel doctorModel;

  const ProfileDoctorLoaded({required this.doctorModel});
}

class ScheduleAllDoctorLoaded extends DoctorState {
  final List<DoctorModel> doctorList;

  const ScheduleAllDoctorLoaded({required this.doctorList});
}

class ErrorDoctorState extends DoctorState {
  final String message;

  const ErrorDoctorState({required this.message});
}
