import 'package:flutter/material.dart';
import 'package:closet_assist/services/items_fetch_service.dart';
import 'package:closet_assist/provider/search_query_provider.dart';
import 'package:provider/provider.dart';

import '../models/categories.dart';
import '../models/item.dart';
import '../provider/category_provider.dart';

class ItemsViewModel extends ChangeNotifier {
  final ItemsFetchService _itemsService = ItemsFetchService();

  Stream<List<Item>> getItemsStream(
      BuildContext context, String searchQuery, Category? category) {
    return _itemsService.getItems().map(
      (items) {
        if (searchQuery != "") {
          items = items
              .where((item) =>
                  item.name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();
        }
        if (category == null || category.name == 'All') {
          items = items..sort((a, b) => b.timestamp.compareTo(a.timestamp));
        } else {
          items =
              items.where((item) => item.category == category.name).toList();
          items = items..sort((a, b) => b.timestamp.compareTo(a.timestamp));
        }
        // move this line here
        return items;
      },
    );
  }
}
