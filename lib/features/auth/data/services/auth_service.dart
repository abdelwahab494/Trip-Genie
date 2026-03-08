import 'package:trip_genie/core/manager/app_imports.dart';

class AuthService {
  final SupabaseClient supabase = SupabaseHelper.supabaseClient;

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return supabase.auth.signUp(
      email: email,
      password: password,
      data: {"name": name},
    );
  }

  Future<void> signOut() async {
    return supabase.auth.signOut();
  }

  Future<void> requestResetToken(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  Future<void> verifyOTP({
    required String email,
    required String resetToken,
  }) async {
    await supabase.auth.verifyOTP(
      email: email,
      token: resetToken,
      type: OtpType.recovery,
    );
  }

  Future<void> updateUserAttributes({
    String? name,
    String? email,
    String? password,
  }) async {
    await supabase.auth.updateUser(
      UserAttributes(
        password: password,
        email: email,
        data: name != null ? {"name": name} : null,
      ),
    );
  }

  User? get currentUser => supabase.auth.currentUser;

  Session? get currentSession => supabase.auth.currentSession;

  Map<String, dynamic>? get userMetadata => currentUser?.userMetadata;

  String? getUserMetadataField(String key) {
    return userMetadata?[key] as String?;
  }
}
