


import 'package:trip_genie/core/manager/app_imports.dart';

class CityModel {
  final String? id;
  final String name;
  final String? description;
  final double? lat;
  final double? lng;
  final List<String>? images;
  final DateTime? createdAt;

  CityModel({
    this.id,
    required this.name,
    this.description,
    this.lat,
    this.lng,
    this.images,
    this.createdAt,
  });

  // From Supabase response
  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      id: map[SupabaseHelper.citiesIdColumn] as String?,
      name: map[SupabaseHelper.citiesNameColumn] as String,
      description: map[SupabaseHelper.citiesDescColumn] as String?,
      lat: map[SupabaseHelper.citiesLatColumn] != null
          ? (map[SupabaseHelper.citiesLatColumn] as num).toDouble()
          : null,
      lng: map[SupabaseHelper.citiesLngColumn] != null
          ? (map[SupabaseHelper.citiesLngColumn] as num).toDouble()
          : null,
      images: map[SupabaseHelper.citiesImagesColumn] != null
          ? List<String>.from(map[SupabaseHelper.citiesImagesColumn])
          : null,
      createdAt: map[SupabaseHelper.citiesCreatedAtColumn] != null
          ? DateTime.parse(map[SupabaseHelper.citiesCreatedAtColumn].toString())
          : null,
    );
  }

  // To Supabase request
  Map<String, dynamic> toMap() {
    return {
      if (id != null) SupabaseHelper.citiesIdColumn: id,
      SupabaseHelper.citiesNameColumn: name,
      SupabaseHelper.citiesDescColumn: description,
      SupabaseHelper.citiesLatColumn: lat,
      SupabaseHelper.citiesLngColumn: lng,
      SupabaseHelper.citiesImagesColumn: images,
      if (createdAt != null)
        SupabaseHelper.citiesCreatedAtColumn: createdAt!.toIso8601String(),
    };
  }

  CityModel copyWith({
    String? id,
    String? name,
    String? description,
    double? lat,
    double? lng,
    List<String>? images,
    DateTime? createdAt,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}