// import 'package:flutter/material.dart';
// import 'package:garden_app_ui/model/plant_model.dart';
// import 'package:garden_app_ui/model/globals.dart';

// import '../model/category_model.dart';

// class HomeScreenProvider with ChangeNotifier {
//   List<bool> isIconClickedList = List.generate(100, (index) => false);
//   List<bool> isCategoryClicked = [true, false, false, false, false];
//   int selectedCategoryIndex = 0;
//   List<PlantModel> filteredPlants = [];
//   final categories = ['All', 'Indoor', 'Outdoor', 'Thallophyta', 'Bryophyta'];
//   TextEditingController searchController = TextEditingController();

//   HomeScreenProvider() {
//     filteredPlants = plants;
//     _updateFavoriteIconState();
//   }

//   void updateCategory(int index) {
//     for (int i = 0; i < isCategoryClicked.length; i++) {
//       isCategoryClicked[i] = i == index;
//     }
//     selectedCategoryIndex = index;
//     _filterPlants();
//     notifyListeners();
//   }

//   void _filterPlants() {
//     final query = searchController.text.toLowerCase();
//     final selectedCategory = categories[selectedCategoryIndex];
//     filteredPlants = plants.where((plant) {
//       final nameLower = plant.name.toLowerCase();
//       final matchesName = nameLower.contains(query);
//       final matchesCategory =
//           selectedCategory == 'All' || plant.category == selectedCategory;
//       return matchesName && matchesCategory;
//     }).toList();
//     notifyListeners();
//   }

//   void _updateFavoriteIconState() {
//     for (int i = 0; i < plants.length; i++) {
//       isIconClickedList[i] = favoritePlants.contains(plants[i]);
//     }
//     notifyListeners();
//   }

//   void toggleFavorite(int index, PlantModel plant) {
//     isIconClickedList[index] = !isIconClickedList[index];
//     if (isIconClickedList[index]) {
//       favoritePlants.add(plant);
//     } else {
//       favoritePlants.remove(plant);
//     }
//     notifyListeners();
//   }
// }
