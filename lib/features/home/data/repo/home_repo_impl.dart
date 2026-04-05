import 'package:dartz/dartz.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

class HomeRepoImpl implements HomeRepo {
  final CitiesDatabaseService citiesDatabaseService;

  HomeRepoImpl(this.citiesDatabaseService);

  @override
  Future<Either<SupabaseFailure, List<CityModel>>> getAllCities() async {
    try {
      var list = await citiesDatabaseService.getAllCities();

      var res = list.map((dataMap) => CityModel.fromJson(dataMap)).toList();
      return right(res);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Stream<Either<SupabaseFailure, List<CityModel>>> stream() async* {
    try {
      await for (final mapsList in citiesDatabaseService.stream) {
        final cityModels = mapsList
            .map((map) => CityModel.fromJson(map))
            .toList();

        yield right<SupabaseFailure, List<CityModel>>(cityModels);
      }
    } catch (e) {
      yield left<SupabaseFailure, List<CityModel>>(
        SupabaseFailure.fromException(e),
      );
    }
  }

  @override
  Future<Either<SupabaseFailure, List<CityModel>>> searchCities(
    String query,
  ) async {
    try {
      final list = await citiesDatabaseService.searchCities(query);
      final res = list.map((e) => CityModel.fromJson(e)).toList();
      return right(res);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
