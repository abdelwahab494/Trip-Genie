import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsRepoImpl implements TravelTipsRepo {
  final TravelTipsService _tipsService;
  TravelTipsRepoImpl(this._tipsService);

  @override
  Future<Either<GeminiFailure, List<TravelTipModel>>> getTravelTips() async {
    try {
      final String tipsString = await _tipsService.generateTips(
        Part.text("""
You are a travel assistant specialized in tourism in Egypt.

Generate helpful travel tips for tourists visiting Egypt.

Rules:
- Return between 6 and 10 travel tips.
- Each tip must include:
  - icon: a Flutter Material icon name that represents the tip.
  - title: a short title (2–3 words).
  - description: a short paragraph of exactly 4 sentences explaining the tip.

Guidelines:
- Tips should be practical and useful for tourists in Egypt.
- Focus on things like safety, transportation, culture, money, weather, and local etiquette.
- The icon must be a valid Flutter Material icon name (for example: flight, map, restaurant, local_taxi, attach_money, security, language).

Return the result strictly as a valid JSON array in this format:

[
  {
    "icon": "map",
    "title": "Plan Routes",
    "description": "Use Google Maps to plan your trips around the city. Cairo traffic can be very busy during peak hours. Try to leave early in the morning to avoid delays. Saving locations offline can help when internet access is limited."
  },
  {
    "icon": "attach_money",
    "title": "Cash Payments",
    "description": "Many small shops in Egypt prefer cash payments. Always carry small Egyptian pound notes for taxis and local markets. Credit cards are accepted mainly in malls and large restaurants. ATMs are widely available in major cities."
  }
]

Do not include any explanation, text, or formatting outside the JSON array.
"""),
      );

      final List tipsMapsList = jsonDecode(tipsString);
      final List<TravelTipModel> tipsModelList = tipsMapsList
          .map((e) => TravelTipModel.fromJson(e))
          .toList();

      return Right(tipsModelList);
    } catch (e) {
      return Left(GeminiFailure(e.toString()));
    }
  }

  // List<TravelTipModel> _parseGeminiResponse(String text) {
  //   List<TravelTipModel> tips = [];
  //   final lines = text.split('\n').where((l) => l.contains(':')).toList();
  //   for (var line in lines) {
  //     final parts = line.split(':');
  //     if (parts.length >= 2) {
  //       tips.add(
  //         TravelTipModel(
  //           category: parts[0].trim(),
  //           description: parts.sublist(1).join(':').trim(),
  //         ),
  //       );
  //     }
  //   }
  //   return tips;
  // }
}
