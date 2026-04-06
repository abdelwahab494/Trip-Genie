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

  Future<void> savePlan(TripModel trip) async {
    final result = await repo.addTripPlan(trip);

    result.fold(
      (failure) => emit(PlansLocalError(failure.message)),
      (_) => emit(PlansLocalSuccess("Plan Saved Successfully")),
    );
  }

  Future<void> loadPlan() async {
    final result = await repo.getTripPlans();

    result.fold(
      (failure) => emit(PlansLocalError(failure.message)),
      (tripsList) => emit(PlansLocalLoaded(tripsList)),
    );
  }

  Future<void> deletePlan(int index) async {
    final result = await repo.deleteTripPlan(index);

    result.fold(
      (failure) => emit(PlansLocalError(failure.message)),
      (_) => emit(PlansLocalSuccess("Plan Deleted Successfully")),
    );
  }
}
