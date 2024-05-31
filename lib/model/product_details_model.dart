import 'package:garden_app_ui/model/category_model.dart';

class PlantDetailsLikeModel {
  final PlantModel plant;
  final bool isFavorite;
  final Function(bool) onFavoriteToggle;

  PlantDetailsLikeModel({
    required this.plant,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });
}
