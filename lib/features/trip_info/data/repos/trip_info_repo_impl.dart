import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

@LazySingleton(as: TripInfoRepo, env: [InjectionEnv.dev])
class TripInfoRepoImpl extends TripInfoRepo {
  final TripInfoService service;

  TripInfoRepoImpl(this.service);

  @override
  Future<Either<Failure, List<PlacesModel>>> getPlacesForCity(
    String cityId,
  ) async {
    try {
      final result = await service.getPlacesForCity(cityId);
      final List<PlacesModel> placesList = result
          .map((place) => PlacesModel.fromMap(place))
          .toList();
      return Right(placesList);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }
}
