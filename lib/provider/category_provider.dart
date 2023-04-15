import 'package:closet_assist/models/categories.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class CategoryProvider extends ChangeNotifier {
  Category? _categorySelected;
  List<Item> _items = [];

  Category? get categorySelected => _categorySelected;

  set categorySelected(Category? value) {
    _categorySelected = value;
    notifyListeners();
  }

  CategoryProvider() {
    _categorySelected = categories[0];
  }
}
