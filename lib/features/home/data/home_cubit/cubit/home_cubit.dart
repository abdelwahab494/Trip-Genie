import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';
import 'package:trip_genie/features/home/data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  StreamSubscription? _subscription;
  Timer? _debounce;
  

  List<TravelTipModel> _cachedTips = [];

  final List<String> categories = [
    "Local Currency",
    "Best Time to Visit",
    "Transportation Tips",
    "Culture & Etiquette",
    "Connectivity"
  ];

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getCitiesOnce() async {
    emit(HomeLoading());

    final cityResult = await repo.getAllCities();
  

    cityResult.fold(
      (failure) => emit(HomeError(failure.message)),
      (cities) => emit(HomeLoaded(
        cities: cities,
        categoryTips: _cachedTips, 
      )),
    );
  }
  Future<void> getSmartGuide() async {
    if (_cachedTips.isEmpty) {
      _cachedTips = await repo.getSmartGuide(categories);
    }

  }

  void searchCities(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      if (query.isEmpty) {
        getCitiesOnce();
        return;
      }

      emit(HomeLoading());
      final result = await repo.searchCities(query);

      result.fold(
        (failure) => emit(HomeError(failure.message)),
       
        (cities) => emit(HomeLoaded(
          cities: cities, 
          isSearch: true, 
          categoryTips: _cachedTips,
        )),
      );
    });
  }
  



  void streamCities() {
    emit(HomeLoading());

    _subscription = repo.stream().listen((either) {
      either.fold(
        (failure) => emit(HomeError(failure.message)),
        (cities) => emit(HomeLoaded(cities: cities, categoryTips: [])),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
