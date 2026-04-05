part of 'plans_cubit.dart';

sealed class PlansState {}

final class PlansInitial extends PlansState {}

final class PlansLoading extends PlansState {}

final class PlansError extends PlansState {
  final String message;

  PlansError(this.message);
}

final class PlansLoaded extends PlansState {
  final List<PlacesModel> planPlacesList;

  PlansLoaded({required this.planPlacesList});
}
