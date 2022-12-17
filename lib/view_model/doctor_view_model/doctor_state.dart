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

  @override
  List<Object> get props => [doctorModel];
}

class ScheduleAllDoctorLoaded extends DoctorState {
  final List<DoctorModel> doctorList;

  const ScheduleAllDoctorLoaded({required this.doctorList});

  @override
  List<Object> get props => [doctorList];
}

class ExpiredTokenDoctor extends DoctorState {
  final String message;

  const ExpiredTokenDoctor({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorDoctor extends DoctorState {
  final String message;

  const ErrorDoctor({required this.message});

  @override
  List<Object> get props => [message];
}
