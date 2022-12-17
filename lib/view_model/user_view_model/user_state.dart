part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}

class UserRoleLoaded extends UserState {
  final int roleId;

  const UserRoleLoaded(this.roleId);

  @override
  List<Object> get props => [roleId];
}

class DataUserLoaded extends UserState {
  final AuthModel dataUser;

  const DataUserLoaded({required this.dataUser});

  @override
  List<Object> get props => [dataUser];
}
