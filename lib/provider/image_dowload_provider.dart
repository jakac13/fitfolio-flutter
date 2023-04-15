import 'package:flutter/material.dart';

class ImageDownloadProvider extends ChangeNotifier {
  String? _downloadURL;

  String get downloadURL => _downloadURL ?? "";

  set downloadURL(String value) {
    _downloadURL = value;
    notifyListeners();
  }
}
