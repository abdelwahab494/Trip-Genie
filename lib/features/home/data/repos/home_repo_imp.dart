import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/errors/supbase_faluire.dart';
import 'package:trip_genie/core/networking/databases/cities/cities_database.dart';
import 'package:trip_genie/core/networking/databases/cities/cities_model.dart';
import 'package:trip_genie/core/networking/gemini_service/gemini_service.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';
import 'package:trip_genie/features/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final CitiesDatabase citiesDatabase;
  final GeminiService geminiService;

  HomeRepoImp({required this.citiesDatabase, required this.geminiService});

  @override
  Future<Either<SupabaseFailure, List<CityModel>>> getAllCities() async {
    try {
      var list = await citiesDatabase.getAllCities();
      log("DEBUG: Raw Data from Supabase: $list");
      var res = list.map((dataMap) => CityModel.fromJson(dataMap)).toList();
      return right(res);
    } catch (e,stackTrace) {
       log("DEBUG: Error Type: ${e.runtimeType}");
  log("DEBUG: Error Message: $e");
  log("DEBUG: StackTrace: $stackTrace");
      return left(SupabaseFailure.fromException(e));
    }
  }

@override
Stream<Either<SupabaseFailure, List<CityModel>>> stream() async* {
  try {
    await for (final mapsList in citiesDatabase.stream) {
      final cityModels =
          mapsList.map((map) => CityModel.fromJson(map)).toList();

      yield right<SupabaseFailure, List<CityModel>>(cityModels);
    }
  } catch (e,stackTrace) {
   log("DEBUG: Error Type: ${e.runtimeType}");
  log("DEBUG: Error Message: $e");
  log("DEBUG: StackTrace: $stackTrace");
    yield left<SupabaseFailure, List<CityModel>>(
      SupabaseFailure.fromException(e),
    );
    
  }
}

@override
Future<Either<SupabaseFailure, List<CityModel>>> searchCities(String query) async {
  try {
    final list = await citiesDatabase.searchCities(query);
    final res = list.map((e) => CityModel.fromJson(e)).toList();
    return right(res);
  } catch (e, stackTrace) {
    log("Search Error: $e");
    log("StackTrace: $stackTrace");
    return left(SupabaseFailure.fromException(e));
  }
}

  @override
  Future<List<TravelTipModel>> getSmartGuide(List<String> categories) async {
    try {
      return await geminiService.getSmartGuide(categories);
    } catch (e, stackTrace) {
      log("Gemini Error: $e");
      log("StackTrace: $stackTrace");
      // Fallback to default tips if Gemini fails
      return categories.map((cat) => TravelTipModel(
        category: cat, 
        description: "Essential tips for your journey through Egypt."
      )).toList();
    }
  }

}
