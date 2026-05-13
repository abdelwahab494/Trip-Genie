import 'package:trip_genie/core/manager/app_imports.dart';

abstract class TripPlanDatasource {
  Future<void> addTripPlan(TripModel trip);

  Future<List<TripModel>> getTripPlans();

  Future<void> deleteTripPlan(int index);
}

@LazySingleton(as: TripPlanDatasource, env: [InjectionEnv.dev])
class HiveTripPlanDatasource extends TripPlanDatasource {
  final Box<TripModel> tripBox;

  HiveTripPlanDatasource({required this.tripBox});

  @override
  Future<void> addTripPlan(TripModel trip) async {
    await tripBox.add(trip);
  }

  @override
  Future<List<TripModel>> getTripPlans() async {
    return tripBox.values.toList();
  }

  @override
  Future<void> deleteTripPlan(int index) async {
    await tripBox.deleteAt(index);
  }
}
