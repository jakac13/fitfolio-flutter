import 'package:closet_assist/models/categories.dart';
import 'package:flutter/material.dart';

class CategoryDropdownBtnProvider extends ChangeNotifier {
  Category? _categorySelected;

  Category? get categorySelected => _categorySelected;

  set categorySelected(Category? value) {
    _categorySelected = value;
    notifyListeners();
  }
}
