import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class SavesRepoImpl extends SavesRepo {
  final TripPlanDatasource services;

  SavesRepoImpl(this.services);

  @override
  Future<Either<Failure, List<TripModel>>> getSavedTrips() async {
    try {
      final result = await services.getTripPlans();
      return Right(result);
    } catch (e) {
      return Left(HiveFailure("Failed to Load Plans"));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSavedTrip(int index) async {
    try {
      await services.deleteTripPlan(index);
      return Right("Trip Plan deleted Successfully");
    } catch (e) {
      return Left(HiveFailure("Failed to Delete Plan"));
    }
  }
}
