import 'package:trip_genie/core/manager/app_imports.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 1)
class TripModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<PlacesModel> places;

  @HiveField(2)
  final String cityName;

@HiveField(3)
  final String tripDuration;

  @HiveField(4)
  final DateTime createdAt;

  TripModel({
    required this.name,
    required this.places,
    required this.cityName,
    required this.tripDuration,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
