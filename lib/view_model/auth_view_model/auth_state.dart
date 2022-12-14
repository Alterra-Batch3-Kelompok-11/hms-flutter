part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessLoginState extends AuthState {}

class ErrorLoginState extends AuthState {
  final String message;
  const ErrorLoginState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AuthIsLogin extends AuthState {}

class AuthIsLogout extends AuthState {}

class AuthIsNotLogin extends AuthState {}

class AuthIsRemember extends AuthState {
  final bool isRemember;
  final String username;

  const AuthIsRemember({required this.isRemember, required this.username});
}

class AuthExpiredToken extends AuthState {}
