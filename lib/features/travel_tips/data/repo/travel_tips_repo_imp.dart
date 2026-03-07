import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsRepoImpl implements TravelTipsRepo {
  final TravelTipsService _tipsService;
  TravelTipsRepoImpl(this._tipsService);

  final List<String> categories = [
    "Local Currency",
    "Best Time to Visit",
    "Transportation Tips",
    "Culture & Etiquette",
    "Connectivity",
  ];

  @override
  Future<Either<GeminiFailure, List<TravelTipModel>>>
  getTravelTips() async {
    try {
      final String categoriesString = categories.join(", ");
      final String tipsString = await _tipsService.generateTips(
        Part.text(
          "Create a smart travel guide for Egypt. "
          "For each of these categories: $categoriesString, "
          "provide a helpful description (15-20 words). "
          "Format exactly like this: "
          "Category: Description",
        ),
      );

      return Right(_parseGeminiResponse(tipsString));
    } catch (e) {
      return Left(GeminiFailure(e.toString()));
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
