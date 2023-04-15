import 'package:flutter/material.dart';

class ItemColorProvider extends ChangeNotifier {
  Color? _color;

  Color? get color => _color;

  set color(Color? value) {
    _color = value;
    notifyListeners();
  }
}
