import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoadingState());

      try {
        var data = await authService.login(
            username: event.username, password: event.password);

        print("sukses");
        emit(SuccessLoginState());
      } on DioError catch (e) {
        print("error");
        emit(ErrorLoginState(message: e.message));
      }
    });
  }
}
