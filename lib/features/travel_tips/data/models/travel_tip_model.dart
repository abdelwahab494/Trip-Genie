class TravelTipModel {
  final String icon;
  final String title;
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
