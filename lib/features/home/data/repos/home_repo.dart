import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/errors/supbase_faluire.dart';
import 'package:trip_genie/core/networking/databases/cities/cities_model.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';

abstract class HomeRepo {
  Stream<Either<SupabaseFailure, List<CityModel>>> stream();
  Future<Either<SupabaseFailure, List<CityModel>>> getAllCities();
  Future<Either<SupabaseFailure, List<CityModel>>> searchCities(String query);
  Future<List<TravelTipModel>> getSmartGuide(List<String> categories);
}
