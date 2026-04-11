import 'dart:io';

import 'package:trip_genie/core/manager/app_imports.dart';

class ProfileService {
  final SupabaseClient supabase = SupabaseHelper.supabaseClient;
  final AuthService authService;

  ProfileService(this.authService);

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

  Future<void> updateUserProfile(UserModel user) async {
    await supabase
        .from(SupabaseHelper.profileTable)
        .update(user.toJson())
        .eq(SupabaseHelper.profileIdColumn, user.id);
  }

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
