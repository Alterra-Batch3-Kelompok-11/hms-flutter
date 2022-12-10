part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

class GetOutpatientUnprocessed extends PatientEvent {}

class GetOutpatientProcessed extends PatientEvent {}
