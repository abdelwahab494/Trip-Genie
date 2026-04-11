// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "home_cubit.dart";

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CityModel> cities;
  final bool isSearch;
  final UserModel? user;

  HomeLoaded({required this.cities, this.isSearch = false, this.user});

  HomeLoaded copyWith({
    List<CityModel>? cities,
    bool? isSearch,
    UserModel? user,
  }) {
    return HomeLoaded(
      cities: cities ?? this.cities,
      isSearch: isSearch ?? this.isSearch,
      user: user ?? this.user,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
