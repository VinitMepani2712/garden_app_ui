import 'package:garden_app_ui/model/plant_model.dart';

class PlantModel {
  final String imagePath;
  final String name;
  final String price;
  final String description;
  final String category;

  PlantModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  });
}

List<PlantModel> getPlantsByCategory(String category) {
  if (category == 'All') {
    return plants;
  }
  return plants.where((plant) => plant.category == category).toList();
}



