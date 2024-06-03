import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../model/plant_model.dart';

class HomeProviderScreen with ChangeNotifier {
  List<PlantModel> allPlantsData = [];
  List<PlantModel> filteredPlants = [];
  List<PlantModel> favoritePlants = [];
  TextEditingController searchController = TextEditingController();

  List<String> categories = [
    'All',
    'Indoor',
    'Outdoor',
    'Thallophyta',
    'Bryophyta'
  ];

  int selectedCategoryIndex = 0;

  void installDataLoad() {
    allPlantsData.addAll(plantsDataDummy);
    filteredPlants.addAll(allPlantsData);
  }

  void updateCatogryData({required int index}) {
    filteredPlants = [];

    if (index == 0) {
      selectedCategoryIndex = index;
      filteredPlants.addAll(allPlantsData);
      notifyListeners();
      return;
    }

    selectedCategoryIndex = index;

    for (var data in allPlantsData) {
      if (data.category == categories[index]) {
        filteredPlants.add(data);
      }
    }
    searchData(value: searchController.text);
    notifyListeners();
  }

  void updateFavoriteData({required int id}) {
    List<PlantModel> tempData = allPlantsData;
    for (var data in tempData) {
      if (data.id == id) {
        data.isFavourite = !data.isFavourite;
        if (data.isFavourite) {
          favoritePlants.add(data);
        } else {
          favoritePlants.removeWhere((plant) => plant.id == id);
        }
      }
    }
    allPlantsData = tempData;
    notifyListeners();
  }

  void searchData({required String value}) {
    List<PlantModel> tempList = [];

    for (var data in allPlantsData) {
      if (selectedCategoryIndex == 0) {
        if (data.name.toLowerCase().contains(value.toLowerCase())) {
          tempList.add(data);
        }
      } else if (data.name.toLowerCase().contains(value.toLowerCase()) &&
          (data.category == categories[selectedCategoryIndex])) {
        tempList.add(data);
      }
    }
    filteredPlants = tempList;
    notifyListeners();
  }
}
