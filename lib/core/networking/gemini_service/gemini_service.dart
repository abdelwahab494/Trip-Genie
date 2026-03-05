import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';

class GeminiService {
  final Gemini _gemini = Gemini.instance;
  Future<List<TravelTipModel>> getSmartGuide(List<String> categories) async {
    final categoriesString = categories.join(", ");
    try {
      final response = await _gemini.prompt(
        parts: [
          Part.text(
            "Create a smart travel guide for Egypt. "
            "For each of these categories: $categoriesString, "
            "provide a helpful description (15-20 words). "
            "Format exactly like this: "
            "Category: Description",
          ),
        ],
      );

      final text = response?.output ?? "";
      return _parseGeminiResponse(text);
    } catch (e) {
      throw Exception("Failed to Load smart Travel Tips");
    }
  }

  List<TravelTipModel> _parseGeminiResponse(String text) {
    List<TravelTipModel> tips = [];
    final lines = text.split('\n').where((l) => l.contains(':')).toList();
    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length >= 2) {
        tips.add(
          TravelTipModel(
            category: parts[0].trim(),
            description: parts.sublist(1).join(':').trim(),
          ),
        );
      }
    }
    return tips;
  }
}
