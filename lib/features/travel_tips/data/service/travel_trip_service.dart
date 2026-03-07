import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsService {
  Future<String> generateTips(Part part) async {
    final key = GeminiKeyManager.travelTipsKeys.getKey();
    final gemini = GeminiFactory.create(key);
    final response = await gemini.prompt(parts: [part]);
    return response?.output ?? "";
  }
}
