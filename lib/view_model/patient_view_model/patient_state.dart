part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}

class OutpatientLoaded extends PatientState {
  List<OutpatientModel>? outpatientList = [];

  OutpatientLoaded({required this.outpatientList});
}

class PatientQueueTodayLoaded extends PatientState {
  final PatientQueueToday patientQueueToday;

  const PatientQueueTodayLoaded({required this.patientQueueToday});
  @override
  List<Object> get props => [patientQueueToday];
}

class PatientLoading extends PatientState {}

class PatientError extends PatientState {
  final String message;

  const PatientError({required this.message});
}
