part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class SuccessLoginState extends AuthState {}

class ErrorLoginState extends AuthState {
  final String message;
  const ErrorLoginState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class IsLogin extends AuthState {}

class IsLogout extends AuthState {}

class IsNotLogin extends AuthState {}
