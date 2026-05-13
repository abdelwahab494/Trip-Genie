import 'dart:io';

import 'package:trip_genie/core/manager/app_imports.dart';

sealed class ProfileService {
  Future<Map<String, dynamic>?> getProfile();

  Future<void> updateUserProfile(UserModel user);

  Future<String> uploadAndUpdateProfileImage({
    required File file,
    required String userId,
  });
}

@LazySingleton(as: ProfileService, env: [InjectionEnv.dev])
class ProfileServiceImpl implements ProfileService {
  final SupabaseClient supabase;
  final AuthService authService;

  ProfileServiceImpl({required this.authService, required this.supabase});

  @override
  Future<Map<String, dynamic>?> getProfile() async {
    String? currentUserId = authService.currentUser?.id;
    if (currentUserId == null || currentUserId.isEmpty) {
      throw Exception("User not authenticated");
    }

    final result = await supabase
        .from(SupabaseHelper.profileTable)
        .select()
        .eq(SupabaseHelper.profileIdColumn, currentUserId)
        .maybeSingle();

    return result;
  }

  @override
  Future<void> updateUserProfile(UserModel user) async {
    await supabase
        .from(SupabaseHelper.profileTable)
        .update(user.toMap())
        .eq(SupabaseHelper.profileIdColumn, user.id);
  }

  @override
  Future<String> uploadAndUpdateProfileImage({
    required File file,
    required String userId,
  }) async {
    final String path =
        '$userId/profile_${DateTime.now().millisecondsSinceEpoch}.png';

    await supabase.storage
        .from('profile_images')
        .upload(path, file, fileOptions: const FileOptions(upsert: true));

    final String imageUrl = supabase.storage
        .from('profile_images')
        .getPublicUrl(path);

    await supabase
        .from(SupabaseHelper.profileTable)
        .update({SupabaseHelper.profileImageurlColumn: imageUrl})
        .eq(SupabaseHelper.profileIdColumn, userId);

    return imageUrl;
  }
}
