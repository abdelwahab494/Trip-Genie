

import 'package:trip_genie/core/manager/app_imports.dart';

class CitiesDatabase {
  // stream
  Stream<List<Map<String, dynamic>>> get stream {
    return SupabaseHelper.supabaseClient
        .from(SupabaseHelper.citiesTable)
        .stream(primaryKey: [SupabaseHelper.citiesIdColumn]);
  }
  // read(get all cities)

  Future<List<Map<String, dynamic>>> getAllCities() async {
    final List<Map<String, dynamic>> citiesList = await SupabaseHelper
        .supabaseClient
        .from(SupabaseHelper.citiesTable)
        .select();
    return citiesList;
  }
  Future<List<Map<String, dynamic>>> searchCities(String query) async {
  final result = await SupabaseHelper.supabaseClient
      .from(SupabaseHelper.citiesTable)
      .select()
      .ilike('name', '%$query%')
      .limit(20);

  return result;
}
}
