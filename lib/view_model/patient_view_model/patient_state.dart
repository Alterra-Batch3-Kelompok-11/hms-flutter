part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}

// ignore: must_be_immutable
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

  @override
  List<Object> get props => [message];
}

class PatientExpiredToken extends PatientState {
  final String message;

  const PatientExpiredToken({required this.message});

  @override
  List<Object> get props => [message];
}

class OutpatientApprovalSuccess extends PatientState {}

class HistoryVisitLoaded extends PatientState {
  List<Historypatiens> historyList;

  HistoryVisitLoaded({required this.historyList});

  @override
  List<Object> get props => [historyList];
}

class HistoryApprovalsLoaded extends PatientState {
  List<Historypatiensapprovals> historyListApprovals;

  HistoryApprovalsLoaded({required this.historyListApprovals});

  @override
  List<Object> get props => [historyListApprovals];
}

class DetailOutpatientLoaded extends PatientState {
  final OutpatientModel outpatientModel;
  final List<HistoryPatientTreatmentModel> historyList;
  const DetailOutpatientLoaded(
      {required this.outpatientModel, required this.historyList});

  @override
  List<Object> get props => [outpatientModel, historyList];
}

class SuccessInsertCondition extends PatientState {
  final int outPatientSessionId;
  final int outPatientId;

  const SuccessInsertCondition(
      {required this.outPatientSessionId, required this.outPatientId});

  @override
  List<Object> get props => [outPatientSessionId, outPatientId];
}

class HistoryPatientTreatmentLoaded extends PatientState {
  final List<HistoryPatientTreatmentModel> historyList;

  const HistoryPatientTreatmentLoaded({required this.historyList});

  @override
  List<Object> get props => [historyList];
}

class NotificationLoaded extends PatientState {
  final List<NotificationModel> notificationList;

  const NotificationLoaded({required this.notificationList});

  @override
  List<Object> get props => [notificationList];
}

class PatientHistoryLoaded extends PatientState {
  final List<Historypatiensapprovals> historyListApprovals;
  final List<Historypatiens> historyList;

  const PatientHistoryLoaded(
      {required this.historyListApprovals, required this.historyList});

  @override
  List<Object> get props => [historyList, historyListApprovals];
}

class PatientScheduleLoaded extends PatientState {
  final List<OutpatientModel> listOutpatientUnprocessed;
  final List<OutpatientModel> listOutpatientApproved;

  const PatientScheduleLoaded(
      {required this.listOutpatientUnprocessed,
      required this.listOutpatientApproved});

  @override
  List<Object> get props => [listOutpatientUnprocessed, listOutpatientApproved];
}
