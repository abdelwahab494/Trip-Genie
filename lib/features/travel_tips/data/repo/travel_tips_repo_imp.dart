import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/errors/gemini_faluire.dart';


import 'package:trip_genie/core/networking/gemini_service/gemini_service.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';

import 'package:trip_genie/features/travel_tips/data/repo/travel_tips_repo.dart';

class TravelTipsRepoImpl implements TravelTipsRepo {
  final GeminiService _geminiService;
  TravelTipsRepoImpl(this._geminiService);
   final List<String> categories = [
    "Local Currency",
    "Best Time to Visit",
    "Transportation Tips",
    "Culture & Etiquette",
    "Connectivity"
  ];


  @override
  Future<Either<GeminiFailure, List<TravelTipModel>>> getHomeCategoryTips() async {
    try {
      final tips = await _geminiService.getSmartGuide(categories);
      return Right(tips); 
    } catch (e) {
     
      return Left(GeminiFailure(e.toString())); 
    }
  }

  
}