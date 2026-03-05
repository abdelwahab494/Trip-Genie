import 'package:dartz/dartz.dart';

import 'package:trip_genie/core/errors/gemini_faluire.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';


abstract class TravelTipsRepo {

  Future<Either<GeminiFailure, List<TravelTipModel>>> getHomeCategoryTips();


}