import 'package:flutter/material.dart';
import 'package:garden_app_ui/model/category_model.dart';
import 'package:garden_app_ui/model/plant_model.dart';

import '../model/globals.dart';

class HomeProviderScreen extends ChangeNotifier {
  List<PlantModel> allPlantsData = [];
  List<PlantModel> filteredPlants = [];
  TextEditingController searchController = TextEditingController();

  List<String> categories = [
    'All',
    'Indoor',
    'Outdoor',
    'Thallophyta',
    'Bryophyta'
  ];

  int selectedCategoryIndex = 0;

  List<int> _isIconClickedList =
      List.generate(favoritePlants.length, (index) => 0);

  List<int> get selectedPlant => _isIconClickedList;

  void addPlant(int value) {
    _isIconClickedList.add(value);
    notifyListeners();
  }

  void removePlant(int value) {
    _isIconClickedList.remove(value);
    notifyListeners();
  }

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
      print(data.category);
      print(categories[index]);
      if (data.category == categories[index]) {
        filteredPlants.add(data);
      }
    }
    searchData(value: searchController.text);
    notifyListeners();
  }

  void updateFavoriteData({required int id}) {
    List<PlantModel> tempData = [];

    tempData.addAll(allPlantsData);
    for (var data in tempData) {
      if (data.id == id) {
        data.isFavourite = !data.isFavourite;
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
