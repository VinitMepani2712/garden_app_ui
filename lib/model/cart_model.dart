import 'package:garden_app_ui/model/category_model.dart';

class CartItem {
  final PlantModel plant;
  int quantity;

  CartItem({required this.plant, this.quantity = 1});
}
List<CartItem> cartItems = [];
