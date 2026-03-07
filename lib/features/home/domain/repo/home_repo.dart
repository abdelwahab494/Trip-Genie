import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class HomeRepo {
  Stream<Either<SupabaseFailure, List<CityModel>>> stream();

  Future<Either<SupabaseFailure, List<CityModel>>> getAllCities();
  
  Future<Either<SupabaseFailure, List<CityModel>>> searchCities(String query);
}
