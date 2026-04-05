import 'package:trip_genie/core/manager/app_imports.dart';

part 'travel_tips_state.dart';

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

    debugPrint("start loading ..");
    final result = await travelTipsRepo.getTravelTips();

    result.fold(
      ((failure) {
        debugPrint(failure.message);
        emit(TravelTipsError(tipsCached));
      }),
      (tips) async {
        debugPrint("sucess");
        _cachedTips = tips;
        emit(TravelTipsLoaded(tips));
        await TravelTipsPrefs.setTipsList(tips);
      },
    );
  }
}
