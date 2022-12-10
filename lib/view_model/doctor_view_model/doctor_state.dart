part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class LoadingDoctor extends DoctorState {}

class ProfileDoctor extends DoctorState {
  final DoctorModel doctorModel;

  const ProfileDoctor({required this.doctorModel});
}

class ListScheduleDoctorLoaded extends DoctorState {
  final List<DoctorModel>? doctorList;

  const ListScheduleDoctorLoaded({required this.doctorList});
}

class ErrorDoctorState extends DoctorState {
  final String message;

  const ErrorDoctorState({required this.message});
}
