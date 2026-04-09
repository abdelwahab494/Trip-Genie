import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

abstract class SavesRepo {
  Future<Either<Failure, List<TripModel>>> getSavedTrips();

  Future<Either<Failure, String>> deleteSavedTrip(int index);
}
