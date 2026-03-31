import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class TripInfoRepoImpl extends TripInfoRepo {
  final TripInfoService service;

  TripInfoRepoImpl(this.service);

  @override
  Future<Either<Failure, List<String>>> getTripCategories(String cityId) async {
    try {
      final result = await service.getPlacesCategories(cityId);
      return Right(result);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }
}
