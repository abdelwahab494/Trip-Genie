import 'package:trip_genie/core/manager/app_imports.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'Gemini_API_KEY1', obfuscate: true)
  static final String geminiApiKey1 = _Env.geminiApiKey1;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANONKEY', obfuscate: true)
  static final String supabaseAnonKey = _Env.supabaseAnonKey;
}
