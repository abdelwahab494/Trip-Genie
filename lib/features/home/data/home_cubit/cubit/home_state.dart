import 'package:trip_genie/core/networking/databases/cities/cities_model.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}


class HomeLoaded extends HomeState {
  final List<CityModel> cities;
  final List<TravelTipModel> categoryTips; 
  final bool isSearch;

  HomeLoaded({
    required this.cities,
    required this.categoryTips, 
    this.isSearch = false,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}