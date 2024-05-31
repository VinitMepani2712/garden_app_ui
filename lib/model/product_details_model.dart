import 'package:garden_app_ui/model/category_model.dart';

class PlantDetailsArguments {
  final PlantModel plant;
  final bool isFavorite;
  final Function(bool) onFavoriteToggle;

  PlantDetailsArguments({
    required this.plant,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });
}
