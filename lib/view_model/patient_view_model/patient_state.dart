part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();
  
  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}
