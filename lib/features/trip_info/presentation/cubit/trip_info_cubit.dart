import 'package:trip_genie/core/manager/app_imports.dart';

part 'trip_info_state.dart';

@Injectable()
class TripInfoCubit extends Cubit<TripInfoState> {
  final TripInfoRepo repo;

  TripInfoCubit(this.repo) : super(TripInfoInitial());

  Future<void> getPlacesForCity(String cityId) async {
    emit(TripInfoLoading());
    final result = await repo.getPlacesForCity(cityId);

    result.fold(
      (failure) => emit(TripInfoError("Failed To Get Categories")),
      (placesList) => emit(TripInfoLoaded(placesList: placesList)),
    );
  }

  void updateStep({required int step}) {
    if (state case TripInfoLoaded loaded) {
      emit(loaded.copyWith(currentStep: step));
    }
  }

  void selectDuration(int index) {
    if (state case TripInfoLoaded loaded) {
      emit(loaded.copyWith(selectedDurationIndex: index));
    }
  }

  void selectStyle(int index) {
    if (state case TripInfoLoaded loaded) {
      emit(loaded.copyWith(selectedStyleIndex: index));
    }
  }

  void startPlan() {
    if (state case TripInfoLoaded loaded) {
      emit(
        TripStartPLan(
          placesList: loaded.placesList,
          tripDuration: loaded.selectedDuration,
          tripStyle: loaded.tripCategories[loaded.selectedStyleIndex ?? 0],
        ),
      );
    }
  }
}
