import 'package:trip_genie/core/manager/app_imports.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepo authRepo;

  UserCubit(this.authRepo) : super(UserInitial()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    emit(UserLoading());

    final result = authRepo.getUserData();

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }

  Future<void> refreshUser() => _loadUser();
}
