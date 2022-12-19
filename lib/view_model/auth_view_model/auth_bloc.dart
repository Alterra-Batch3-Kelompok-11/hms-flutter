import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:hospital_management_system/services/local_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final LocalService _localService;
  AuthBloc(this._authService, this._localService) : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<IsLogin>(_onIsLogin);
    on<IsRemember>(_onIsRemember);
    on<Logout>(_onLogout);
  }

  void _onLogin(Login event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      final AuthModel authModel = await _authService.login(
          username: event.username, password: event.password);

      await _localService.saveDataToLocal(authModel, event.isRemember);

      emit(AuthSuccessLoginState());
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data['message']);
        emit(AuthError(message: e.response!.data['message']));
      } else {
        emit(AuthError(message: e.toString()));
      }
    }
  }

  void _onIsLogin(IsLogin event, Emitter<AuthState> emit) async {
    try {
      final bool expiredToken =
          await _localService.checkExpiredTokenFromLocal();

      print("IS LOGIN $expiredToken");
      if (expiredToken == false) {
        emit(AuthIsLogin());
      }
    } catch (e) {
      if (e is DioError) {
        emit(AuthError(message: e.response!.data['message']));
      } else {
        emit(AuthError(message: e.toString()));
      }
    }
  }

  void _onIsRemember(IsRemember event, Emitter<AuthState> emit) async {
    try {
      final AuthModel dataAuth = await _localService.getDataFromLocal();
      if (dataAuth.isRemember == true) {
        emit(AuthIsRemember(
            isRemember: dataAuth.isRemember!, username: dataAuth.username));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _localService.setDataLocalIfLogout();
      emit(AuthIsLogout());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
