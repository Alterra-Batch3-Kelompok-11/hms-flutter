part of 'outpatient_bloc.dart';

abstract class OutpatientState extends Equatable {
  const OutpatientState();
  
  @override
  List<Object> get props => [];
}

class OutpatientInitial extends OutpatientState {}

class OutpatientLoading extends OutpatientState {}

class OutpatientLoaded extends OutpatientState {

   List<OutpatientModel>? outpatientList = [];

   OutpatientLoaded({ required this.outpatientList});
}

class OutpatientError extends OutpatientState {
  final String message;

  const OutpatientError({required this.message});
}
