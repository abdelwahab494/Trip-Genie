import 'dart:convert';
import 'package:trip_genie/core/manager/app_imports.dart';

class TravelTipsPrefs {
  static const String travilTipsKey = "travelTipsKey";
  static final SharedPreferences _prefs = PrefsHelper.prefs;

  static Future<void> setTipsList(List<TravelTipModel> tipsList) async {
    final String tipsListEncoded = jsonEncode(
      tipsList.map((e) => e.toJson()).toList(),
    );
    await _prefs.setString(travilTipsKey, tipsListEncoded);
  }

  static List<TravelTipModel> getTipsList() {
    final String? tipsListEncode = _prefs.getString(travilTipsKey);

    if (tipsListEncode == null) {
      return [];
    }

    final List decoded = jsonDecode(tipsListEncode);

    return decoded
        .map((e) => TravelTipModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<void> removeTipsList() async {
    await _prefs.remove(travilTipsKey);
  }
}
