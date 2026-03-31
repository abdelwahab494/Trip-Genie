import 'package:trip_genie/core/manager/app_imports.dart';

part 'trip_info_state.dart';

class TripInfoCubit extends Cubit<TripInfoState> {
  final TripInfoRepo repo;

  TripInfoCubit(this.repo) : super(TripInfoInitial());

  void changeState({
    int? selectedTripDuration,
    int? selectedTripStyle,
    int? currentPage,
  }) {
    if (state is! TripInfoLoaded) return;
    final currentState = state as TripInfoLoaded;
    emit(
      currentState.copyWith(
        currentPage: currentPage,
        selectedTripStyle: selectedTripStyle,
        selectedTripDuration: selectedTripDuration,
      ),
    );
  }

  Future<void> getTripCategories(String cityId) async {
    emit(TripInfoLoading());
    final result = await repo.getTripCategories(cityId);

    result.fold(
      (failure) => emit(TripInfoError(message: "Failed To Get Categories")),
      (categories) => emit(TripInfoLoaded(tripCategories: categories)),
    );
  }
}
