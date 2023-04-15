import 'package:flutter/material.dart';

import '../models/item.dart';
import '../pages/item_info_page.dart';
import '../widgets/card_popup_menu.dart';

class ItemUserInteractionViewModel extends ChangeNotifier {
  int? _selectedIndex;
  Offset _tapPosition = Offset.zero;

  int? get selectedIndex => _selectedIndex;

  set setSelectedIndex(int? value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Offset? get tapPosition => _tapPosition;

  set setTapPosition(Offset value) {
    _tapPosition = value;
    notifyListeners();
  }

  void handleTap(Item item, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemInfoPage(
          item: item,
        ),
      ),
    );
  }

  void handleLongPressDown(item, context) {
    CardPopupMenu.show(context, _tapPosition, item);
  }

  void handleTapDown(TapDownDetails details, BuildContext context) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    final Offset position = referenceBox.localToGlobal(details.localPosition);
    _tapPosition = position;
    notifyListeners();
  }
}
