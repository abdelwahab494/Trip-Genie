import 'package:trip_genie/core/manager/app_imports.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 1)
class TripModel extends HiveObject{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<PlacesModel> places;

  TripModel({required this.name, required this.places});
}
