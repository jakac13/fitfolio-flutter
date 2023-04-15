import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../services/items_delete.dart';
import '../provider/selected_item_index.dart';
import 'delete_alert_dialog.dart';

class CardPopupMenu {
  static Future<String?> show(
      BuildContext context, Offset? tapPosition, Item item) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    if (tapPosition == null) {
      return null;
    }
    final result = await showMenu(
      color: Colors.white,
      context: context,
      surfaceTintColor: Colors.white,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          tapPosition.dx,
          tapPosition.dy,
          0,
          0,
        ),
        Rect.fromLTWH(
          0,
          0,
          overlay!.paintBounds.size.width,
          overlay.paintBounds.size.height,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      items: [
        PopupMenuItem(
          value: 'edit',
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.edit,
                  size: 16,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Edit")
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: const [
              Icon(
                Icons.delete,
                color: Colors.red,
                size: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ],
    );

    switch (result) {
      case 'edit':
        break;
      case 'delete':
        final deleteItemDialog = DeleteItemAlertDialog(
          popTwoPages: false,
        );
        deleteItemDialog.show(context, item);
        break;
    }

    return result;
  }
}
