part of 'profile_cubit.dart';

@immutable
class ProfileState extends Equatable {
  final String? userId;
  final bool isLoading;
  final UserModel? profile;
  final bool isEditing;
  final bool isUpdating;
  final bool updateSuccess;
  final String? errorMessage;

  final bool isUploadingImage;
  final String? imageErrorMessage;

  const ProfileState({
    this.isLoading = false,
    this.isUpdating = false,
    this.isEditing = false,
    this.updateSuccess = false,
    this.isUploadingImage = false,
    this.profile,
    this.errorMessage,
    this.userId,
    this.imageErrorMessage,
  });

  ProfileState copyWith({
    String? userId,
    bool? isLoading,
    bool? isUpdating,
    bool? isEditing,
    bool? updateSuccess,
    UserModel? profile,
    String? errorMessage,
    bool clearError = false,
    bool? isUploadingImage,
    String? imageErrorMessage,
    bool clearImageError = false,
  }) {
    return ProfileState(
      userId: userId ?? this.userId,
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isEditing: isEditing ?? this.isEditing,
      updateSuccess: updateSuccess ?? false,
      profile: profile ?? this.profile,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      imageErrorMessage: clearImageError ? null : (imageErrorMessage ?? this.imageErrorMessage),
    );
  }

  @override
  String toString() =>
      'ProfileState(Loading: $isLoading, Updating: $isUpdating, '
      'UploadingImage: $isUploadingImage, Success: $updateSuccess, '
      'Error: ${errorMessage != null})';

  @override
  List<Object?> get props => [
        userId,
        isLoading,
        isUpdating,
        isEditing,
        updateSuccess,
        profile,
        errorMessage,
        isUploadingImage,
        imageErrorMessage,
      ];
}