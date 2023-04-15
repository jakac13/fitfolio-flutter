import 'package:flutter/material.dart';

class SearchQueryProvider extends ChangeNotifier {
  String _searchQuery = "";

  String get search => _searchQuery;

  set searchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void resetSearchQuery() {
    _searchQuery = '';
    notifyListeners();
  }
}
