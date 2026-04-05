part of 'trip_info_cubit.dart';

sealed class TripInfoState {}

final class TripInfoInitial extends TripInfoState {}

final class TripInfoLoading extends TripInfoState {}

final class TripInfoError extends TripInfoState {
  final String message;
  TripInfoError(this.message);
}

final class TripInfoLoaded extends TripInfoState {
  final List<PlacesModel> placesList;
  final List<String> tripDurationsList;   
  final int currentStep;                

  final int? selectedDurationIndex;
  final int? selectedStyleIndex;

  TripInfoLoaded({
    required this.placesList,
    this.tripDurationsList = const ["Half Day", "Full day", "Multi day"],
    this.currentStep = 0,
    this.selectedDurationIndex = 0,
    this.selectedStyleIndex = 0,
  });

  TripInfoLoaded copyWith({
    List<PlacesModel>? placesList,
    int? currentStep,
    int? selectedDurationIndex,
    int? selectedStyleIndex,
  }) {
    return TripInfoLoaded(
      placesList: placesList ?? this.placesList,
      currentStep: currentStep ?? this.currentStep,
      selectedDurationIndex: selectedDurationIndex ?? this.selectedDurationIndex,
      selectedStyleIndex: selectedStyleIndex ?? this.selectedStyleIndex,
    );
  }

  // getters نظيفة
  String get selectedDuration => tripDurationsList[selectedDurationIndex ?? 0];
  List<String> get tripCategories => placesList.map((p) => p.category!).toSet().toList();
}
final class TripStartPLan extends TripInfoState {
  final List<PlacesModel> placesList;
  final String tripDuration;
  final String tripStyle;

  TripStartPLan({
    required this.placesList,
    required this.tripDuration,
    required this.tripStyle,
  });
}