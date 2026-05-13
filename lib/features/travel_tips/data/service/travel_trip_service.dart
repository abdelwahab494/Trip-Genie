import 'package:trip_genie/core/manager/app_imports.dart';

sealed class TravelTipsService {
  Future<String> generateTips(Part part);
}

@LazySingleton(as: TravelTipsService, env: [InjectionEnv.dev])
class TravelTipsServiceImpl implements TravelTipsService {
  @override
  Future<String> generateTips(Part part) async {
    final key = GeminiKeyManager.travelTipsKeys.getKey();
    final gemini = GeminiFactory.create(key);
    final response = await gemini.prompt(parts: [part]);
    return response?.output ?? "";
  }
}
