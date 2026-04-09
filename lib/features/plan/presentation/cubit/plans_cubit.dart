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
      (planPlacesList) => emit(
        PlansLoaded(
          planPlacesList: planPlacesList,
          cityName: cityName,
          category: category,
          tripDuration: tripDuration,
          placesList: planPlacesList,
        ),
      ),
    );
  }

  void removeFromPlan(int index) {
    if (state is! PlansLoaded) return;
    final current = state as PlansLoaded;

    final updatedList = List<PlacesModel>.from(current.planPlacesList)
      ..removeAt(index);

    emit(current.copyWith(planPlacesList: updatedList));
  }

  void replaceInPlan(PlacesModel oldPlace, PlacesModel newPlace) {
    if (state is! PlansLoaded) return;

    final current = state as PlansLoaded;

    final list = List<PlacesModel>.from(current.planPlacesList);

    final index = list.indexWhere(
      (place) => place.id == oldPlace.id || place.name == oldPlace.name,
    );

    if (index != -1) {
      list[index] = newPlace;
      emit(current.copyWith(planPlacesList: list));
    } else {
      list.add(newPlace);
      emit(current.copyWith(planPlacesList: list));
    }
  }

  Future<void> savePlan(TripModel trip) async {
    final result = await repo.addTripPlan(trip);

    result.fold(
      (failure) => emit(PlansLocalError(failure.message)),
      (_) => emit(PlansLocalSuccess("Plan Saved Successfully")),
    );
  }
}
