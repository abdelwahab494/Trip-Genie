import 'dart:async';
import 'package:trip_genie/core/manager/app_imports.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  StreamSubscription? _subscription;
  Timer? _debounce;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getCitiesOnce() async {
    emit(HomeLoading());

    final cityResult = await repo.getAllCities();

    cityResult.fold((failure) => emit(HomeError(failure.message)), (cities) {
      final result = repo.getCachedUser();

      result.fold(
        (failure) => MyApp.navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (c) => LoginScreen()),
        ),
        (user) => emit(HomeLoaded(cities: cities, user: user)),
      );
    });
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

        (cities) => emit(HomeLoaded(cities: cities, isSearch: true)),
      );
    });
  }

  void streamCities() {
    emit(HomeLoading());

    _subscription = repo.stream().listen((either) {
      either.fold(
        (failure) => emit(HomeError(failure.message)),
        (cities) => emit(HomeLoaded(cities: cities)),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
