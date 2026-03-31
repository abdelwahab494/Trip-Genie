part of 'trip_info_cubit.dart';

sealed class TripInfoState {}

final class TripInfoInitial extends TripInfoState {}

final class TripInfoLoading extends TripInfoState {}

final class TripInfoLoaded extends TripInfoState {
  final List<String> tripCategories;
  final int selectedTripDuration;
  final int selectedTripStyle;
  final int currentPage;
  final List<String> tripDurationsList= ["Half Day", "Full-Day", "Multi-Day"];

  TripInfoLoaded({
    required this.tripCategories,
    this.selectedTripDuration = 0,
    this.selectedTripStyle = 0,
    this.currentPage = 0,
  });

  TripInfoLoaded copyWith({
    List<String>? tripCategories,
    int? selectedTripDuration,
    int? selectedTripStyle,
    int? currentPage,
  }) {
    return TripInfoLoaded(
      tripCategories: tripCategories ?? this.tripCategories,
      selectedTripDuration: selectedTripDuration ?? this.selectedTripDuration,
      selectedTripStyle: selectedTripStyle ?? this.selectedTripStyle,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

final class TripInfoError extends TripInfoState {
  final String message;

  TripInfoError({required this.message});
}
