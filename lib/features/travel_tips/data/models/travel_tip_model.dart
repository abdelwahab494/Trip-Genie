class TravelTipModel {
  final String category;
  final String description;

  TravelTipModel({
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'category': category,
      'description': description,
    };
  }

  factory TravelTipModel.fromJson(Map<String, dynamic> map) {
    return TravelTipModel(
      category: map['category'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'description': description,
    };
  }
}
