import 'package:trip_genie/core/manager/app_imports.dart';

class SupabaseHelper {
  static SupabaseClient get supabaseClient => Supabase
      .instance
      .client; //supabaseClient to a getter (=>), you ensure that Supabase.instance.client is only evaluated when you actually use it (i.e., after the app has started and the initialization has finished).

  //initialize Supabase
  //  static Future<void> init() async {
  //     await Supabase.initialize(
  //       url: 'https://dbkqsmuwrlngryjpvjgx.supabase.co',
  //       anonKey: 'sb_publishable_XSAurIex_QX1J56ejomTMA_S2ndZYAD',
  //     );
  //   }
  
  // Cities Table
  static const String citiesTable = "cities";
  static const String citiesIdColumn = 'id';
  static const String citiesNameColumn = 'name';
  static const String citiesDescColumn = 'description';
  static const String citiesLatColumn = 'lat';
  static const String citiesLngColumn = 'lng';
  static const String citiesImagesColumn = 'images';
  static const String citiesCreatedAtColumn = 'created_at';

  // Places Table
  static const String placesTable = "places";
  static const String placesIdColumn = 'id';
  static const String placesNameColumn = 'name';
  static const String placesCityIdColumn = 'city_id';
  static const String placesRegionIdColumn = 'region_id';
  static const String placesDescColumn = 'description';
  static const String placesAddressColumn = 'address';
  static const String placesLatColumn = 'lat';
  static const String placesLngColumn = 'lng';
  static const String placesImagesColumn = 'images';
  static const String placesCategoryColumn = 'category';
  static const String placesOpeningHoursColumn = 'opening_hours';
  static const String placesCreatedAtColumn = 'created_at';
}
