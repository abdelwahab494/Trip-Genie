import 'package:trip_genie/core/manager/app_imports.dart';

abstract class CachedUserDatasource {
  Future<void> cacheUser(UserModel user);

  UserModel? getCachedUser();

  Future<void> deleteCachedUser();

  bool get isLoggedIn;
}

class CachedUserHiveDatasource implements CachedUserDatasource {
  final Box<UserModel> box;
  static const String userKey = "UserKey";

  CachedUserHiveDatasource(this.box);

  @override
  Future<void> cacheUser(UserModel user) async {
    await box.put(userKey, user);
  }

  @override
  Future<void> deleteCachedUser() async {
    await box.delete(userKey);
  }

  @override
  UserModel? getCachedUser() => box.get(userKey);

  @override
  bool get isLoggedIn => box.containsKey(userKey);
}
