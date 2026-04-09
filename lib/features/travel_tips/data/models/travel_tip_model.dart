import 'package:trip_genie/core/manager/app_imports.dart';

part 'travel_tip_model.g.dart';

@HiveType(typeId: 2)
class TravelTipModel extends HiveObject{
  @HiveField(0)
  final String icon;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  TravelTipModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'icon': icon,
      'title': title,
      'description': description,
    };
  }

  factory TravelTipModel.fromJson(Map<String, dynamic> json) {
    return TravelTipModel(
      icon: json['icon'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
    );
  }
}
