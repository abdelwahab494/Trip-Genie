part of 'saves_cubit.dart';

sealed class SavesState {}

final class SavesInitial extends SavesState {}

final class SavesLoaded extends SavesState {
  final List<TripModel> tripsList;

  SavesLoaded({required this.tripsList});
}

final class SavesError extends SavesState {
  final String message;

  SavesError(this.message);
}

final class SavesSuccess extends SavesState {
  final String message;

  SavesSuccess(this.message);
}

final class SavesFailes extends SavesState {
  final String message;

  SavesFailes(this.message);
}
