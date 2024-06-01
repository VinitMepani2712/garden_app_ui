import 'package:garden_app_ui/model/category_model.dart';


List<PlantModel> favoritePlants = [];

void toggleFavorite(PlantModel plant) {
  if (favoritePlants.contains(plant)) {
    favoritePlants.remove(plant);
  } else {
    favoritePlants.add(plant);
  }
}
