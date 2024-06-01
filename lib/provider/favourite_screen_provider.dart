import 'package:flutter/material.dart';

import '../model/globals.dart';

class FavoriteScreenProvider extends ChangeNotifier {
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
}
