part of 'nurse_bloc.dart';

abstract class NurseEvent extends Equatable {
  const NurseEvent();

  @override
  List<Object> get props => [];
}

class GetProfileNurse extends NurseEvent {}
