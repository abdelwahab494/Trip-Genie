import 'package:trip_genie/core/ai/key_rotator.dart';
import 'package:trip_genie/core/env/env.dart';

class GeminiKeyManager {
  static final travelTipsKeys = KeyRotator([
    Env.geminiApiKey1,
  ]);
}
