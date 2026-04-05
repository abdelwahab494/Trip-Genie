import 'package:trip_genie/core/manager/app_imports.dart';

class GeminiKeyManager {
  static final travelTipsKeys = KeyRotator([Env.tripsTipsKey1, Env.tripsTipsKey2]);
  static final tripPLanKeys = KeyRotator([Env.plansKey1, Env.plansKey2]);
}
