part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

class GetOutpatientUnprocessed extends PatientEvent {}

class GetOutpatientProcessed extends PatientEvent {}

class GetPatientQueueToday extends PatientEvent {}

class PutOutpatientApproval extends PatientEvent {
  // final int idOutpatient;
  // final String status;

  // PutOutpatientApproval({required this.idOutpatient, required this.status});
}
