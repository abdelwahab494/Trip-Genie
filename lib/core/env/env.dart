import 'package:trip_genie/core/manager/app_imports.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TRIPS_TIPS_KEY1', obfuscate: true)
  static final String tripsTipsKey1 = _Env.tripsTipsKey1;

  @EnviedField(varName: 'TRIPS_TIPS_KEY2', obfuscate: true)
  static final String tripsTipsKey2 = _Env.tripsTipsKey2;

  @EnviedField(varName: 'PLANS_KEY1', obfuscate: true)
  static final String plansKey1 = _Env.plansKey1;

  @EnviedField(varName: 'PLANS_KEY2', obfuscate: true)
  static final String plansKey2 = _Env.plansKey2;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANONKEY', obfuscate: true)
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField(varName: 'ONE_SIGNAL_KEY', obfuscate: true)
  static final String oneSignalKey = _Env.oneSignalKey;
}
