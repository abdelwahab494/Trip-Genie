import 'dart:io';
import 'package:trip_genie/core/manager/app_imports.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(const ProfileState());

  // ─── Load Profile ───────────────────────────────────────────────────────────

  Future<void> getProfile() async {
    // if (userId == null || userId.isEmpty) {
    //   emit(state.copyWith(errorMessage: 'User ID is missing'));
    //   return;
    // }

    emit(state.copyWith(isLoading: true));

    final result = await profileRepo.getUserProfile();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (profile) => emit(state.copyWith(isLoading: false, profile: profile)),
    );
  }

  // ─── Edit Profile ────────────────────────────────────────────────────────────

  void startEditing() => emit(state.copyWith(isEditing: true));

  Future<void> updateProfile(UserModel updatedData) async {
    emit(state.copyWith(isUpdating: true, clearError: true));

    final result = await profileRepo.updateUserProfile(updatedData);
    result.fold(
      (failure) => emit(
        state.copyWith(isUpdating: false, errorMessage: failure.message),
      ),
      (_) => emit(
        state.copyWith(
          isUpdating: false,
          profile: updatedData,
          updateSuccess: true,
        ),
      ),
    );
  }

  // ─── Upload Profile Image ─────────────────────

  Future<void> uploadProfileImage(File file, String userId) async {
    emit(state.copyWith(isUploadingImage: true, clearImageError: true));

    final result = await profileRepo.updateProfileImage(file, userId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isUploadingImage: false,
          imageErrorMessage: failure.message,
        ),
      ),
      (updatedUser) => emit(
        state.copyWith(
          isUploadingImage: false,

          profile: state.profile?.copyWith(imageUrl: updatedUser.imageUrl),
        ),
      ),
    );
  }
}
