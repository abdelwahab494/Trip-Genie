import 'package:trip_genie/core/manager/app_imports.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  final PlansRepo repo;
  PlansCubit(this.repo) : super(PlansInitial());

  Future<void> generatePlan({
    required String cityName,
    required String category,
    required String tripDuration,
    required List<PlacesModel> placesList,
  }) async {
    emit(PlansLoading());

    final result = await repo.generatePlan(
      cityName: cityName,
      category: category,
      tripDuration: tripDuration,
      placesList: placesList,
    );

    result.fold(
      (failure) => emit(PlansError(failure.message)),
      (planPlacesList) => emit(PlansLoaded(planPlacesList: planPlacesList)),
    );
  }
}
