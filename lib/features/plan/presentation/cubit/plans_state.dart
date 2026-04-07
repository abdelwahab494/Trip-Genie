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
  final String cityName;
  final String category;
  final String tripDuration;
  final List<PlacesModel> placesList;

  PlansLoaded({
    required this.planPlacesList,
    required this.cityName,
    required this.category,
    required this.tripDuration,
    required this.placesList,
  });

  PlansLoaded copyWith({
    List<PlacesModel>? planPlacesList,
    String? cityName,
    String? category,
    String? tripDuration,
    List<PlacesModel>? placesList,
  }) {
    return PlansLoaded(
      planPlacesList: planPlacesList ?? this.planPlacesList,
      cityName: cityName ?? this.cityName,
      category: category ?? this.category,
      tripDuration: tripDuration ?? this.tripDuration,
      placesList: placesList ?? this.placesList,
    );
  }
}

final class PlansLocalSuccess extends PlansState {
  final String message;

  PlansLocalSuccess(this.message);
}

final class PlansLocalLoaded extends PlansState {
  final List<TripModel> tripPlansList;

  PlansLocalLoaded(this.tripPlansList);
}

final class PlansLocalError extends PlansState {
  final String message;

  PlansLocalError(this.message);
}
