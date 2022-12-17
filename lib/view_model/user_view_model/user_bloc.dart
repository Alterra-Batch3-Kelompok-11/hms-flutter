import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_management_system/models/auth_model.dart';
import 'package:hospital_management_system/services/local_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalService _localService;

  UserBloc(this._localService) : super(UserInitial()) {
    on<GetDataUser>((event, emit) async {
      emit(UserLoading());
      try {
        final AuthModel dataUser = await _localService.getDataFromLocal();
        emit(DataUserLoaded(dataUser: dataUser));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });

    on<GetUserRole>((event, emit) async {
      emit(UserLoading());

      try {
        final int userRole = await _localService.getRoleIdFromLocal();

        emit(UserRoleLoaded(userRole));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
