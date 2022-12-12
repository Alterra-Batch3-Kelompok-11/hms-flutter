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

class PatientLoading extends PatientState {}

class PatientError extends PatientState {
  final String message;

  const PatientError({required this.message});
}
// ignore: must_be_immutable
class HistoryVisitLoaded  extends PatientState{
 List<Historypatiens>? historyList = [];


  HistoryVisitLoaded({required this.historyList});
}
class HistoryApprovalsLoaded  extends PatientState{
 List<Historypatiensapprovals>? historyListApprovals = [];


  HistoryApprovalsLoaded({required this.historyListApprovals});
}