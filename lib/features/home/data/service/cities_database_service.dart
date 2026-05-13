import 'package:trip_genie/core/manager/app_imports.dart';

sealed class CitiesDatabaseService {
  Stream<List<Map<String, dynamic>>> get stream;

  Future<List<Map<String, dynamic>>> getAllCities();

  Future<List<Map<String, dynamic>>> searchCities(String query);
}

@LazySingleton(as: CitiesDatabaseService, env: [InjectionEnv.dev])
class CitiesDatabaseServiceImpl implements CitiesDatabaseService {
  // stream
  @override
  Stream<List<Map<String, dynamic>>> get stream {
    return SupabaseHelper.supabaseClient
        .from(SupabaseHelper.citiesTable)
        .stream(primaryKey: [SupabaseHelper.citiesIdColumn]);
  }
  // read(get all cities)

  @override
  Future<List<Map<String, dynamic>>> getAllCities() async {
    final List<Map<String, dynamic>> citiesList = await SupabaseHelper
        .supabaseClient
        .from(SupabaseHelper.citiesTable)
        .select();
    return citiesList;
  }

  @override
  Future<List<Map<String, dynamic>>> searchCities(String query) async {
    final result = await SupabaseHelper.supabaseClient
        .from(SupabaseHelper.citiesTable)
        .select()
        .ilike('name', '%$query%')
        .limit(20);

    return result;
  }
}
