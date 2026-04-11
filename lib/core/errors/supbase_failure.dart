
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class SupabaseFailure extends Failure {
  const SupabaseFailure(super.message);

  factory SupabaseFailure.fromException(Object error) {
    if (error is PostgrestException) {
      return ServerFailure(error.message);
    }

    if (error is AuthException) {
      return AuthFailure(error.message);
    }

    if (error is StorageException) {
      return StorageFailure(error.message);
    }

    return const ServerFailure("Unexpected error");
  }
}

class ServerFailure extends SupabaseFailure {
  const ServerFailure(super.message);
}

class AuthFailure extends SupabaseFailure {
  const AuthFailure(super.message);
}

class StorageFailure extends SupabaseFailure {
  const StorageFailure(super.message);
}

class UnExpectedFailure extends SupabaseFailure {
  const UnExpectedFailure(super.message);
}

class ProfileFailure extends SupabaseFailure {
  const ProfileFailure(super.message);
}
