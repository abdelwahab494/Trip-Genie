import 'package:trip_genie/core/manager/app_imports.dart';

class HiveHelper {
  static const String tripsBoxName = "trips";
  static const String placesBoxName = "places";
  static const String appBoxName = "appBox";

  // Getters
  static Box<TripModel> get trips =>
      Hive.box<TripModel>(tripsBoxName);

  static Box<PlacesModel> get places =>
      Hive.box<PlacesModel>(placesBoxName);

  static Box<dynamic> get appBox =>
      Hive.box<dynamic>(appBoxName);

  static Future<void> init() async {
    await Hive.initFlutter();

    /// Register Adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PlacesModelAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TripModelAdapter());
    }

    /// Open Boxes
    await Hive.openBox<TripModel>(tripsBoxName);
    await Hive.openBox<PlacesModel>(placesBoxName);
    await Hive.openBox<dynamic>(appBoxName);
  }
}