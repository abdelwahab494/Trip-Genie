import 'package:trip_genie/core/manager/app_imports.dart';

import 'package:trip_genie/core/networking/gemini_service/travel_tip_model.dart';
import 'package:trip_genie/features/travel_tips/data/repo/travel_tips_repo_imp.dart';

part 'travel_tips_state.dart';

class TravelTipsCubit extends Cubit<TravelTipsState> {
  final TravelTipsRepoImpl repository;
  
  // 1. Store the Either result or the List directly
  List<TravelTipModel>? _cachedTips;

  TravelTipsCubit(this.repository) : super(TravelTipsInitial());

  void getHomeTips() async {
    // If we already have the tips, emit them immediately without loading
    if (_cachedTips != null) {
      emit(TravelTipsLoaded(_cachedTips!));
      return;
    }

    emit(TravelTipsLoading());

    // 2. Fetch the result
    final result = await repository.getHomeCategoryTips();

    // 3. Properly fold the Either result
    result.fold(
      (failure) => emit(TravelTipsError(failure.message)),
      (tips) {
        _cachedTips = tips; // Save to cache
        emit(TravelTipsLoaded(tips));
      },
    );
  }
}
