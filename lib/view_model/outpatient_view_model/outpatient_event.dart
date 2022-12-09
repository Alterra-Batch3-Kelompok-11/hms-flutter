part of 'outpatient_bloc.dart';

abstract class OutpatientEvent extends Equatable {
  const OutpatientEvent();

  @override
  List<Object> get props => [];
}

class GetOutpatientUnprocessed extends OutpatientEvent {}

class GetOutpatientProcessed extends OutpatientEvent {}

