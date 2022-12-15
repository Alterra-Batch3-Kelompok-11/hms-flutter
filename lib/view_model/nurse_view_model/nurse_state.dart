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

class NurseProfileLoaded extends NurseState {
  final NurseModel nurse;

  const NurseProfileLoaded({required this.nurse});

  @override
  List<Object> get props => [nurse];
}
