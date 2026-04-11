import 'package:trip_genie/core/manager/app_imports.dart';

part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? bio;

  @HiveField(4)
  final String? imageUrl;

  @HiveField(5)
  final String? phoneNumber;

  UserModel({
    required this.id,
    this.email,
    this.name,
    this.bio,
    this.imageUrl,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[SupabaseHelper.profileIdColumn] as String,
      email: json[SupabaseHelper.profileEmailColumn] as String? ?? '',
      name: json[SupabaseHelper.profileUsernameColumn] as String? ?? '',
      bio: json[SupabaseHelper.profileBioColumn] as String? ?? '',
      imageUrl: json[SupabaseHelper.profileImageurlColumn] as String? ?? '',
      phoneNumber:
          json[SupabaseHelper.profilephoneNumberColumn] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data[SupabaseHelper.profileUsernameColumn] = name;
    if (bio != null) data[SupabaseHelper.profileBioColumn] = bio;
    if (imageUrl != null) data[SupabaseHelper.profileImageurlColumn] = imageUrl;
    if (email != null) data[SupabaseHelper.profileEmailColumn] = email;
    if (phoneNumber != null) {
      data[SupabaseHelper.profilephoneNumberColumn] = phoneNumber;
    }

    return data;
  }

  UserModel copyWith({
    String? name,
    String? bio,
    String? imageUrl,
    String? email,
    String? phoneNumber,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.userMetadata?["name"],
    );
  }
}
