import 'package:trip_genie/core/manager/app_imports.dart';

class PlanResponseModel {
  final String time;
  final String placeName;

  PlanResponseModel({required this.time, required this.placeName,});

  factory PlanResponseModel.fromJson(Map<String, dynamic> json) =>
      PlanResponseModel(time: json["time"], placeName: json["place"]);

  Map<String, dynamic> toJson() => {"time": time, "place": placeName};

  PlanResponseModel copyWith({
    String? time,
    String? placeName,
    PlacesModel? place,
  }) {
    return PlanResponseModel(
      time: time ?? this.time,
      placeName: placeName ?? this.placeName,
    );
  }
}