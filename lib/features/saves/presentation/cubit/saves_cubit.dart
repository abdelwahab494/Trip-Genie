import 'package:trip_genie/core/manager/app_imports.dart';

part 'saves_state.dart';

class SavesCubit extends Cubit<SavesState> {
  final SavesRepo repo;
  SavesCubit(this.repo) : super(SavesInitial());

  Future<void> loadTrips() async {
    final result = await repo.getSavedTrips();

    result.fold(
      (failure) => SavesError(failure.message),
      (tripsList) => emit(SavesLoaded(tripsList: tripsList)),
    );
  }

  Future<void> deleteTrip(int index) async {
    final result = await repo.deleteSavedTrip(index);

    result.fold(
      (failure) => SavesFailes(failure.message),
      (message) => SavesSuccess(message),
    );
  }
}
