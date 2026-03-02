import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_genie/features/home/data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  StreamSubscription? _subscription;
  Timer? _debounce;

  HomeCubit(this.repo) : super(HomeInitial());

  
  Future<void> getCitiesOnce() async {
    emit(HomeLoading());

    final result = await repo.getAllCities();

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (cities) => emit(HomeLoaded(cities)),
    );
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
      (cities) => emit(HomeLoaded(cities,isSearch: true)),
    );
  });
}

  
  void streamCities() {
    emit(HomeLoading());

    _subscription = repo.stream().listen((either) {
      either.fold(
        (failure) => emit(HomeError(failure.message)),
        (cities) => emit(HomeLoaded(cities)),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}