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

  UserModel({required this.id, this.email, this.name});

  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.userMetadata?["name"],
    );
  }
}
