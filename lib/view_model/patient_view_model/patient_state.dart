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

  const DetailOutpatientLoaded({required this.outpatientModel});

  @override
  List<Object> get props => [outpatientModel];
}

class SuccessInsertCondition extends PatientState {}
