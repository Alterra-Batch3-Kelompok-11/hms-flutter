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
    on<Login>((event, emit) async {
      try {
        emit(AuthLoadingState());
        final AuthModel authModel = await _authService.login(
            username: event.username, password: event.password);

        _localService.saveDataToLocalStorage(authModel, event.isRemember);

        emit(AuthSuccessLoginState());
      } catch (e) {
        if (e is DioError) {
          print(e.response!.data['message']);
          emit(ErrorLoginState(message: e.response!.data['message']));
        }
        emit(ErrorLoginState(message: e.toString()));
      }
    });

    on<IsLogin>((event, emit) async {
      final bool? checkLogged = await _authService.isLogin(_localService);

      if (checkLogged == true) {
        emit(AuthIsLogin());
      }
    });

    on<IsRemember>((event, emit) async {
      final AuthModel dataAuth = await _localService.getDataFromLocalStorage();
      if (dataAuth.isRemember == true) {
        emit(AuthIsRemember(
            isRemember: dataAuth.isRemember!, username: dataAuth.username));
      }
    });

    on<Logout>((event, emit) async {
      await _authService.logout(_localService);
      emit(AuthIsLogout());
    });
  }
}
