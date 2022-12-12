part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

class GetOutpatientUnprocessed extends PatientEvent {}

class GetOutpatientApproveds extends PatientEvent {}

class GetPatientQueueToday extends PatientEvent {}

class PutOutpatientApproval extends PatientEvent {
  final int idOutpatient;
  final int isApproved;

  PutOutpatientApproval({required this.isApproved, required this.idOutpatient});
}
class GetHistoryVisit extends PatientEvent{}

class GetHistoryApprovals extends PatientEvent {}