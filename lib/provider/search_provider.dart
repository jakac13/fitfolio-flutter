import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String? _search;

  String get search => _search ?? "";

  set search(value) {
    _search = value;
    notifyListeners();
  }
}
