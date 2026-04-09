import 'package:trip_genie/core/manager/app_imports.dart';

class HiveHelper {
  static const String tripsBoxName = "trips";
  static const String placesBoxName = "places";
  static const String appBoxName = "appBox";
  static const String travelTipsBoxName = "travelTipsBox";
  static const String userBoxName = "userBox";

  // Getters
  static Box<TripModel> get trips => Hive.box<TripModel>(tripsBoxName);

  static Box<PlacesModel> get places => Hive.box<PlacesModel>(placesBoxName);

  static Box<dynamic> get appBox => Hive.box<dynamic>(appBoxName);

  static Box<TravelTipModel> get tips =>
      Hive.box<TravelTipModel>(travelTipsBoxName);

  static Box<UserModel> get user => Hive.box<UserModel>(userBoxName);

  static Future<void> init() async {
    await Hive.initFlutter();

    /// Register Adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PlacesModelAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TripModelAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TravelTipModelAdapter());
    }

    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    /// Open Boxes
    await Hive.openBox<PlacesModel>(placesBoxName);
    await Hive.openBox<TripModel>(tripsBoxName);
    await Hive.openBox<dynamic>(appBoxName);
    await Hive.openBox<TravelTipModel>(travelTipsBoxName);
    await Hive.openBox<UserModel>(userBoxName);
  }
}
