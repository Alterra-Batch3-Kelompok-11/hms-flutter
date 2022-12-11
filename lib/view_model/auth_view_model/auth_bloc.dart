import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/services/auth_service.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  late SharedPreferences _preferences;
  AuthBloc(this._authService) : super(AuthInitial()) {
    on<Login>((event, emit) async {
      try {
        emit(AuthLoadingState());
        final AuthModel authModel = await _authService.login(
            username: event.username, password: event.password);

        /// SIMPAN TOKEN DI LOKAL STORAGE

        // if (event.isRemember == true) {
        //   await _preferences.setString("username", authModel.username);
        // }
        _authService.saveToLocal(authModel, event.isRemember);

        emit(AuthSuccessLoginState());
      } catch (e) {
        if (e is DioError) {
          print(e.response!.data['message']);
          emit(ErrorLoginState(message: e.response!.data['message']));
        }
        emit(ErrorLoginState(message: e.toString()));
      }
    });

    on<CheckLogged>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      String? token = _preferences.getString("token");

      if (token != null) {
        bool? expiredDateToken = Jwt.isExpired(token);
        print("EXPIRED DATE TOKEN " + expiredDateToken.toString());
        print("LOCAL TIME : " + DateTime.now().toLocal().toString());
        if (!expiredDateToken) {
          emit(AuthIsLogin());
        } else {
          print("TOKEN : $token");
          _preferences.remove("token");
        }
      }
    });

    on<CheckIsRemember>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      final bool? isRemember = _preferences.getBool("is_remember");
      final String? username = _preferences.getString("username");
      if (isRemember == true) {
        emit(AuthIsRemember(isRemember: isRemember!, username: username!));
      }
    });

    on<Logout>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      bool? isRemember = _preferences.getBool("is_remember");

      if (isRemember == true) {
        await _preferences.remove("token");
        await _preferences.remove("role_id");
        await _preferences.remove("id");
      } else {
        await _preferences.clear();
      }

      emit(AuthIsLogout());
    });
  }
}
