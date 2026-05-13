import 'package:trip_genie/core/manager/app_imports.dart';

abstract class TravelTipsLocalDatasource {
  Future<void> setTipsList(List<TravelTipModel> tipsList);

  List<TravelTipModel> getTipsList();

  Future<void> deleteTipsList();
}

@LazySingleton(as: TravelTipsLocalDatasource, env: [InjectionEnv.dev])
class TravelTipsHiveDatasource implements TravelTipsLocalDatasource {
  final Box<TravelTipModel> box;

  TravelTipsHiveDatasource(this.box);

  @override
  Future<void> deleteTipsList() async {
    await box.clear();
  }

  @override
  List<TravelTipModel> getTipsList() {
    return box.values.toList();
  }

  @override
  Future<void> setTipsList(List<TravelTipModel> tipsList) async {
    await box.clear();
    await box.addAll(tipsList);
  }
}
