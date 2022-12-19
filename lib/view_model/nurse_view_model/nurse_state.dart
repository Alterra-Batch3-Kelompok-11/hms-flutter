part of 'nurse_bloc.dart';

abstract class NurseState extends Equatable {
  const NurseState();

  @override
  List<Object> get props => [];
}

class NurseInitial extends NurseState {}

class NurseLoading extends NurseState {}

class NurseError extends NurseState {
  final String message;

  const NurseError({required this.message});

  @override
  List<Object> get props => [message];
}

class ExpiredNurseToken extends NurseState {
  final String message;

  const ExpiredNurseToken({required this.message});

  @override
  List<Object> get props => [message];
}

class ProfileNurseLoaded extends NurseState {
  final NurseModel dataNurse;
  final List<ScheduleModel> schedule;

  const ProfileNurseLoaded({required this.dataNurse, required this.schedule});

  @override
  List<Object> get props => [dataNurse, schedule];
}
