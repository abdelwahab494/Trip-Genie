import 'package:trip_genie/core/manager/app_imports.dart';

sealed class AuthService {
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });

  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
    String? bio,
    String? avatar,
    String? phone,
  });

  Future<void> signOut();

  Future<void> requestResetToken(String email);

  Future<void> verifyOTP({required String email, required String resetToken});

  Future<void> updateUserAttributes({
    String? name,
    String? email,
    String? password,
    String? bio,
    String? avatarPath,
    String? phone,
  });

  String? getUserMetadataField(String key);

  User? get currentUser;

  Session? get currentSession;

  Map<String, dynamic>? get userMetadata;
}

@LazySingleton(as: AuthService, env: [InjectionEnv.dev])
class AuthServiceImpl implements AuthService {
  final SupabaseClient supabase;

  AuthServiceImpl(this.supabase);

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
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

  @override
  Future<void> signOut() async {
    return supabase.auth.signOut();
  }

  @override
  Future<void> requestResetToken(String email) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  @override
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

  @override
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

  @override
  User? get currentUser => supabase.auth.currentUser;

  @override
  Session? get currentSession => supabase.auth.currentSession;

  @override
  Map<String, dynamic>? get userMetadata => currentUser?.userMetadata;

  @override
  String? getUserMetadataField(String key) {
    return userMetadata?[key] as String?;
  }
}
