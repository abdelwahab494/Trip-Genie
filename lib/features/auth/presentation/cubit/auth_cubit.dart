import 'package:trip_genie/core/manager/app_imports.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await authRepo.signIn(email: email, password: password);

    result.fold((failure) => emit(AuthError(failure.message)), (response) {
      if (response.user != null) {
        emit(AuthSuccess(response.user!));
      } else {
        emit(AuthError("User not found"));
      }
    });
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );

    result.fold((failure) => emit(AuthError(failure.message)), (response) {
      if (response.user != null) {
        emit(AuthSuccess(response.user!));
      } else {
        emit(AuthError("User not found"));
      }
    });
  }

  Future<void> signOut() async {
    emit(AuthLoading());

    final result = await authRepo.signOut();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthSignedOut()),
    );
  }
}
