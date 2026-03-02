import 'package:trip_genie/core/networking/databases/cities/cities_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CityModel> cities;
  final bool isSearch;

  HomeLoaded(this.cities, {this.isSearch = false});
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}