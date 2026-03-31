import 'package:trip_genie/core/networking/supabase_helper.dart';

class PlacesModel {
  final String? id;
  final String name;
  final String cityId;
  final String? regionId;
  final String? description;
  final String? address;
  final double? lat;
  final double? lng;
  final List<String>? images;
  final String? category;
  final Map<String, dynamic>? openingHours;
  final DateTime? createdAt;
  final String? visitTime;

  PlacesModel({
    this.id,
    required this.name,
    required this.cityId,
    this.regionId,
    this.description,
    this.address,
    this.lat,
    this.lng,
    this.images,
    this.category,
    this.openingHours,
    this.createdAt,
    this.visitTime,
  });

  // From Supabase response
  factory PlacesModel.fromMap(Map<String, dynamic> map) {
    return PlacesModel(
      id: map[SupabaseHelper.placesIdColumn] as String?,
      name: map[SupabaseHelper.placesNameColumn] as String,
      cityId: map[SupabaseHelper.placesCityIdColumn] as String,
      regionId: map[SupabaseHelper.placesRegionIdColumn] as String?,
      description: map[SupabaseHelper.placesDescColumn] as String?,
      address: map[SupabaseHelper.placesAddressColumn] as String?,
      lat: map[SupabaseHelper.placesLatColumn] != null
          ? (map[SupabaseHelper.placesLatColumn] as num).toDouble()
          : null,
      lng: map[SupabaseHelper.placesLngColumn] != null
          ? (map[SupabaseHelper.placesLngColumn] as num).toDouble()
          : null,
      images: map[SupabaseHelper.placesImagesColumn] != null
          ? List<String>.from(map[SupabaseHelper.placesImagesColumn])
          : null,
      category: map[SupabaseHelper.placesCategoryColumn] as String?,
      openingHours: map[SupabaseHelper.placesOpeningHoursColumn] != null
          ? Map<String, dynamic>.from(
              map[SupabaseHelper.placesOpeningHoursColumn],
            )
          : null,
      createdAt: map[SupabaseHelper.placesCreatedAtColumn] != null
          ? DateTime.parse(map[SupabaseHelper.placesCreatedAtColumn].toString())
          : null,
    );
  }

  // To Supabase request
  Map<String, dynamic> toMap() {
    return {
      if (id != null) SupabaseHelper.placesIdColumn: id,
      SupabaseHelper.placesNameColumn: name,
      SupabaseHelper.placesCityIdColumn: cityId,
      SupabaseHelper.placesRegionIdColumn: regionId,
      SupabaseHelper.placesDescColumn: description,
      SupabaseHelper.placesAddressColumn: address,
      SupabaseHelper.placesLatColumn: lat,
      SupabaseHelper.placesLngColumn: lng,
      SupabaseHelper.placesImagesColumn: images,
      SupabaseHelper.placesCategoryColumn: category,
      SupabaseHelper.placesOpeningHoursColumn: openingHours,
      if (createdAt != null)
        SupabaseHelper.placesCreatedAtColumn: createdAt!.toIso8601String(),
    };
  }

  PlacesModel copyWith({
    String? id,
    String? name,
    String? cityId,
    String? regionId,
    String? description,
    String? address,
    double? lat,
    double? lng,
    List<String>? images,
    String? category,
    Map<String, dynamic>? openingHours,
    DateTime? createdAt,
  }) {
    return PlacesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cityId: cityId ?? this.cityId,
      regionId: regionId ?? this.regionId,
      description: description ?? this.description,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      images: images ?? this.images,
      category: category ?? this.category,
      openingHours: openingHours ?? this.openingHours,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
