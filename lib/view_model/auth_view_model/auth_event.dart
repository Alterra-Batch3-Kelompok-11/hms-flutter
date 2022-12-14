part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final String username;
  final String password;
  final bool isRemember;

  const Login(
      {required this.username,
      required this.password,
      required this.isRemember});

  @override
  List<Object> get props => [username, password];
}

class Logout extends AuthEvent {}

class IsLogin extends AuthEvent {}

class IsRemember extends AuthEvent {}

class IsExpiredToken extends AuthEvent {}

class GetRoleId extends AuthEvent {}
