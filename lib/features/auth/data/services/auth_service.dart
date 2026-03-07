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
    return await supabase.auth.signUp(
      email: email,
      password: password,
      data: {"name": name},
    );
  }

  Future<void> signOut() async {
    return await supabase.auth.signOut();
  }

  User? get currentUser => supabase.auth.currentUser;

  Session? get currentSession => supabase.auth.currentSession;

  Map<String, dynamic>? get userMetadata => currentUser?.userMetadata;

  String? getUserMetadataField(String key) {
    return userMetadata?[key] as String?;
  }
}
