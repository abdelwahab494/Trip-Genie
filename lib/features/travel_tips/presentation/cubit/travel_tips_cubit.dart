import 'package:trip_genie/core/local/travel_tips_prefs.dart';
import 'package:trip_genie/core/manager/app_imports.dart';

part 'travel_tips_state.dart';

// class TravelTipsCubit extends Cubit<TravelTipsState> {
//   final TravelTipsRepoImpl repository;

//   // 1. Store the Either result or the List directly
//   List<TravelTipModel>? _cachedTips;

//   TravelTipsCubit(this.repository) : super(TravelTipsInitial());

//   void getHomeTips() async {
//     // If we already have the tips, emit them immediately without loading
//     if (_cachedTips != null) {
//       emit(TravelTipsLoaded(_cachedTips!));
//       return;
//     }

//     emit(TravelTipsLoading());

//     // 2. Fetch the result
//     final result = await repository.getHomeCategoryTips();

//     // 3. Properly fold the Either result
//     result.fold(
//       (failure) => emit(TravelTipsError(failure.message)),
//       (tips) {
//         _cachedTips = tips; // Save to cache
//         emit(TravelTipsLoaded(tips));
//       },
//     );
//   }
// }

class TravelTipsCubit extends Cubit<TravelTipsState> {
  final TravelTipsRepo travelTipsRepo;

  TravelTipsCubit(this.travelTipsRepo) : super(TravelTipsInitial());

  List<TravelTipModel>? _cachedTips;

  Future<void> getTravelTips() async {
    if (_cachedTips != null) {
      emit(TravelTipsLoaded(_cachedTips!));
      return;
    }
    final List<TravelTipModel> tipsCached = TravelTipsPrefs.getTipsList();
    emit(TravelTipsLoading(tipsCached));

    final result = await travelTipsRepo.getTravelTips();

    result.fold(((failure) => emit(TravelTipsError(tipsCached))), (tips) async {
      _cachedTips = tips;
      await TravelTipsPrefs.setTipsList(tips);
      emit(TravelTipsLoaded(tips));
    });
  }
}
