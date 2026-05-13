import 'dart:convert';
import 'package:trip_genie/core/manager/app_imports.dart';

sealed class PlansService {
  Future<List<PlanResponseModel>> generatePlan({
    required String cityName,
    required String category,
    required String tripDuration,
    required List<PlacesModel> placesList,
  });
}

@LazySingleton(as: PlansService, env: [InjectionEnv.dev])
class PlansServiceImpl implements PlansService {
  @override
  Future<List<PlanResponseModel>> generatePlan({
    required String cityName,
    required String category,
    required String tripDuration,
    required List<PlacesModel> placesList,
  }) async {
    final key = GeminiKeyManager.tripPLanKeys.getKey();
    final gemini = GeminiFactory.create(key);

    final placesNames = placesList
        .map((e) => e.name)
        .whereType<String>()
        .join(", ");

    final prompt =
        """
          You are a travel planner AI.

          Create a structured travel schedule for $cityName in Egypt using ONLY the places from this list:
          [$placesNames]

          Trip duration: $tripDuration
          Interest category: $category

          Rules:
          - Use ONLY places from the provided list.
          - Assign a realistic visiting time for each place.
          - Suggest more than 4 and less than 8 based on the trip duration.

          Return the result strictly as valid JSON array like this:

          [
            {"time": "09:00", "place": "Pyramids of Giza"},
            {"time": "mon 12:00", "place": "Egyptian Museum"},
            {"time": "15:30", "place": "Khan El Khalili"},
            {"time": "tue 18:00", "place": "Nile Corniche"}
          ]

          Do not include anything else.
        """;

    final response = await gemini.prompt(parts: [Part.text(prompt)]);

    String responseText = response?.output ?? '';

    final List<dynamic> decoded =
        jsonDecode(responseText.cleanMarkdown) as List;

    final List<PlanResponseModel> result = decoded
        .map<PlanResponseModel>((item) => PlanResponseModel.fromJson(item))
        .toList();

    return result;
  }
}
