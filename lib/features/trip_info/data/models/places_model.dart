import 'package:hive_flutter/adapters.dart';
import 'package:trip_genie/core/networking/supabase_helper.dart';

part 'places_model.g.dart';

@HiveType(typeId: 0)
class PlacesModel extends HiveObject{
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String cityId;

  @HiveField(3)
  final String? regionId;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String? address;

  @HiveField(6)
  final double? lat;

  @HiveField(7)
  final double? lng;

  @HiveField(8)
  final List<String>? images;

  @HiveField(9)
  final String? category;

  @HiveField(10)
  final Map<String, dynamic>? openingHours;

  @HiveField(11)
  final DateTime? createdAt;

  @HiveField(12)
  final String visitTime;

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
    this.visitTime = "afternoon",
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
    String? visitTime,
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
      visitTime: visitTime ?? this.visitTime,
    );
  }
}
