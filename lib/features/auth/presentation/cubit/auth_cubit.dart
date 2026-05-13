import 'package:trip_genie/core/manager/app_imports.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await authRepo.signIn(email: email, password: password);

    if (isClosed) return;

    result.fold((failure) => emit(AuthError(failure.message)), (model) {
      emit(AuthSuccess(model));
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

    if (isClosed) return;

    result.fold((failure) => emit(AuthError(failure.message)), (model) {
      emit(AuthSuccess(model));
    });
  }

  Future<void> signOut() async {
    emit(AuthLoading());

    final result = await authRepo.signOut();

    if (isClosed) return;

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthSignedOut()),
    );
  }

  Future<void> requestResetToken(String email) async {
    emit(AuthLoading());

    final result = await authRepo.requestResetToken(email);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthReset()),
    );
  }

  Future<void> verifyAndUpdatePassword({
    required String email,
    required String resetToken,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await authRepo.verifyAndUpdatePassword(
      email: email,
      resetToken: resetToken,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthReset()),
    );
  }
}
