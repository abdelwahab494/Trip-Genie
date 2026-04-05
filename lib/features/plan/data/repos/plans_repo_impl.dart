import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class PlansRepoImpl implements PlansRepo {
  final PlansService service;

  const PlansRepoImpl(this.service);

  @override
  Future<Either<Failure, List<PlacesModel>>> generatePlan({
    required String cityName,
    required String category,
    required String tripDuration,
    required List<PlacesModel> placesList,
  }) async {
    try {
      final List<PlanResponseModel> responsePlacesList = await service
          .generatePlan(
            cityName: cityName,
            category: category,
            tripDuration: tripDuration,
            placesList: placesList,
          );
      final List<PlacesModel> planPlaces = responsePlacesList
          .map(
            (item) => placesList
                .firstWhere((place) => place.name == item.placeName)
                .copyWith(visitTime: item.time),
          )
          .toList();
      return Right(planPlaces);
    } catch (e) {
      return Left(GeminiFailure("Failed to generate plan"));
    }
  }
}
