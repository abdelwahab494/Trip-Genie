import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class TravelTipsRepo {
  Future<Either<GeminiFailure, List<TravelTipModel>>> getTravelTips();

  List<TravelTipModel> getCachedTips();
}
