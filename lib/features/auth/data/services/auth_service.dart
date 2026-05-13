import 'package:trip_genie/core/manager/app_imports.dart';

class AuthService {
  final SupabaseClient supabase;

  AuthService(this.supabase);

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
    String? bio,
    String? avatar,
    String? phone,
  }) async {
    return supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        SupabaseHelper.userNameMetaData: name,
        SupabaseHelper.userBioMetaData: bio,
        SupabaseHelper.userAvatarPathMetaData: avatar,
        SupabaseHelper.userPhoneMetaData: phone,
      },
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
    String? bio,
    String? avatarPath,
    String? phone,
  }) async {
    final Map<String, dynamic> data = {};

    if (name != null) data[SupabaseHelper.userNameMetaData] = name;
    if (bio != null) data[SupabaseHelper.userBioMetaData] = bio;
    if (avatarPath != null) {
      data[SupabaseHelper.userAvatarPathMetaData] = avatarPath;
    }
    if (phone != null) data[SupabaseHelper.userPhoneMetaData] = phone;

    await supabase.auth.updateUser(
      UserAttributes(
        email: email,
        password: password,
        data: data.isNotEmpty ? data : null,
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
