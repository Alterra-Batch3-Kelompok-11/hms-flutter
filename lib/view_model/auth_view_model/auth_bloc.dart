import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  late SharedPreferences _preferences;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<Login>((event, emit) async {
      try {
        emit(AuthLoadingState());
        final AuthModel authModel = await authService.login(
            username: event.username, password: event.password);

        /// SIMPAN TOKEN DI LOKAL STORAGE
        _preferences = await SharedPreferences.getInstance();
        await _preferences.setString("token", authModel.token);
        await _preferences.setString("username", authModel.username);
        await _preferences.setInt("role_id", authModel.roleId);
        await _preferences.setInt("id", authModel.doctor.id);

        emit(AuthSuccessLoginState());
      } on DioError catch (e) {
        print(e.response!.data['message']);
        emit(ErrorLoginState(message: e.response!.data['message']));
      }
    });

    on<CheckLogged>((event, emit) async {
      emit(AuthLoadingState());

      _preferences = await SharedPreferences.getInstance();
      String? token = _preferences.getString("token");

      if (token == null) {
        emit(AuthIsNotLogin());
      } else {
        emit(AuthIsLogin());
      }
    });

    on<Logout>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      await _preferences.clear();
      emit(AuthIsLogout());
    });
  }
}
