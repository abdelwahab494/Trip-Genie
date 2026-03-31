import 'package:trip_genie/core/manager/app_imports.dart';

class TripInfoService {
  Future<List<String>> getPlacesCategories(String cityId) async {
    final response = await SupabaseHelper.supabaseClient
        .from(SupabaseHelper.placesTable)
        .select(SupabaseHelper.placesCategoryColumn)
        .eq(SupabaseHelper.placesCityIdColumn, cityId);
    final categories = response
        .map<String>(
          (place) => place[SupabaseHelper.placesCategoryColumn] as String,
        )
        .toSet()
        .toList();
    return categories;
  }
}
