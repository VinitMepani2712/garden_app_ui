import 'package:garden_app_ui/model/plant_model.dart';

class PlantModel {
  int id;
  String imagePath;
  String name;
  int price;
  String description;
  String category;
  bool isFavourite;

  PlantModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.isFavourite,
  });

  PlantModel copyWith({
    int? id,
    String? imagePath,
    String? name,
    int? price,
    String? description,
    String? category,
    bool? isFavourite,
  }) {
    return PlantModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}

List<PlantModel> getPlantsByCategory(String category) {
  if (category == 'All') {
    return plantsDataDummy;
  }
  return plantsDataDummy.where((plant) => plant.category == category).toList();
}

