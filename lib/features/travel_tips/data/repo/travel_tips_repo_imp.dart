import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

@LazySingleton(as: TravelTipsRepo, env: [InjectionEnv.dev])
class TravelTipsRepoImpl implements TravelTipsRepo {
  final TravelTipsService tipsService;
  final TravelTipsLocalDatasource localDatasource;
  TravelTipsRepoImpl({required this.tipsService, required this.localDatasource});

  @override
  Future<Either<GeminiFailure, List<TravelTipModel>>> getTravelTips() async {
    try {
      final String tipsString = await tipsService.generateTips(
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
      await localDatasource.setTipsList(tipsModelList);

      return Right(tipsModelList);
    } catch (e) {
      return Left(GeminiFailure(e.toString()));
    }
  }
  
  @override
  List<TravelTipModel> getCachedTips() {
      final List<TravelTipModel> tipsList = localDatasource.getTipsList();
      return tipsList;
  }
}
