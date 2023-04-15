import 'package:flutter/material.dart';

class ImagePathProvider extends ChangeNotifier {
  String? _imagePath;
  String? _imageName;

  String get imagePath => _imagePath ?? "";
  String get imageName => _imageName ?? "";

  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  set imageName(String value) {
    _imageName = value;
    notifyListeners();
  }
}
