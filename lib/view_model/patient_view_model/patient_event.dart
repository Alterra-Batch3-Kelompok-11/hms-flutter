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

  const PutOutpatientApproval(
      {required this.isApproved, required this.idOutpatient});

  @override
  List<Object> get props => [idOutpatient, isApproved];
}

class GetHistoryVisit extends PatientEvent {}

class GetHistoryApprovals extends PatientEvent {}

class GetDetailOutpatient extends PatientEvent {
  final int outSessionId;
  final int patientId;

  const GetDetailOutpatient(
      {required this.outSessionId, required this.patientId});

  @override
  List<Object> get props => [outSessionId, patientId];
}

class InsertConditionPatient extends PatientEvent {
  final int patientSessionId;
  final String allergy;
  final String condition;
  final String medicine;

  const InsertConditionPatient({
    required this.patientSessionId,
    required this.allergy,
    required this.condition,
    required this.medicine,
  });

  @override
  List<Object> get props => [patientSessionId, allergy, condition, medicine];
}

class GetHistoryPatientTreatment extends PatientEvent {
  final int patientId;

  const GetHistoryPatientTreatment({required this.patientId});

  @override
  List<Object> get props => [patientId];
}

class GetPatientHistory extends PatientEvent {}

class GetPatientSchedule extends PatientEvent {}

class GetNotification extends PatientEvent {}
