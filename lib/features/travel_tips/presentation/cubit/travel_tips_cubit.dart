import 'package:trip_genie/core/manager/app_imports.dart';

part 'travel_tips_state.dart';

@Injectable()
class TravelTipsCubit extends Cubit<TravelTipsState> {
  final TravelTipsRepo travelTipsRepo;

  TravelTipsCubit({required this.travelTipsRepo}) : super(TravelTipsInitial());

  List<TravelTipModel>? _cachedTips;

  Future<void> getTravelTips() async {
    if (_cachedTips != null) {
      emit(TravelTipsLoaded(_cachedTips!));
      return;
    }
    final List<TravelTipModel> tipsCached = travelTipsRepo.getCachedTips();
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
      },
    );
  }
}
