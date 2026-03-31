import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class TripInfoRepo {
  Future<Either<Failure, List<PlacesModel>>> getPlacesForCity(String cityId);
}
