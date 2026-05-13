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
  final String? imagePath;

  @HiveField(5)
  final String? phoneNumber;

  UserModel({
    required this.id,
    this.email,
    this.name,
    this.bio,
    this.imagePath,
    this.phoneNumber,
  });

  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.userMetadata?[SupabaseHelper.userNameMetaData],
      bio: user.userMetadata?[SupabaseHelper.userBioMetaData],
      imagePath: user.userMetadata?[SupabaseHelper.userAvatarPathMetaData],
      phoneNumber: user.userMetadata?[SupabaseHelper.userPhoneMetaData],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      SupabaseHelper.userIdColumn: id,
      SupabaseHelper.userEmailColumn: email,
      SupabaseHelper.userNameMetaData: name,
      SupabaseHelper.userBioMetaData: bio,
      SupabaseHelper.userAvatarPathMetaData: imagePath,
      SupabaseHelper.userPhoneMetaData: phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[SupabaseHelper.userIdColumn] as String,
      email: map[SupabaseHelper.userEmailColumn] != null
          ? map[SupabaseHelper.userEmailColumn] as String
          : null,
      name: map[SupabaseHelper.userNameMetaData] != null
          ? map[SupabaseHelper.userNameMetaData] as String
          : null,
      bio: map[SupabaseHelper.userBioMetaData] != null
          ? map[SupabaseHelper.userBioMetaData] as String
          : null,
      imagePath: map[SupabaseHelper.userAvatarPathMetaData] != null
          ? map[SupabaseHelper.userAvatarPathMetaData] as String
          : null,
      phoneNumber: map[SupabaseHelper.userPhoneMetaData] != null
          ? map[SupabaseHelper.userPhoneMetaData] as String
          : null,
    );
  }

  UserModel copyWith({
    String? name,
    String? bio,
    String? imagePath,
    String? email,
    String? phoneNumber,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      imagePath: imagePath ?? this.imagePath,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
