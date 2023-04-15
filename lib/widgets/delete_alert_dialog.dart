import 'package:closet_assist/widgets/buttons/primary_btn_dialog_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/constants/colors.dart' as color;

import '../models/item.dart';
import '../services/items_delete.dart';
import '../provider/selected_item_index.dart';
import 'buttons/primary_btn_dialog.dart';
import 'buttons/secondary_btn_dialog.dart';

class DeleteItemAlertDialog extends StatelessWidget {
  final bool popTwoPages;
  const DeleteItemAlertDialog({Key? key, required this.popTwoPages})
      : super(key: key);

  void show(BuildContext context, Item item) {
    String uid = item.uid;
    ItemsDelete itemsDelete = ItemsDelete();
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: Row(
            children: const [
              Icon(
                Icons.delete_forever,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Delete Item?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color.textPrimary,
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Do you really want to delete this item from your closet?'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'This process cannot be undone.',
                  style: TextStyle(color: color.textSecondary),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            PrimaryBtnDialogIcon(
              buttonText: "Delete",
              onPressedFunction: () {
                itemsDelete.deleteItem(item.uid).then(
                  (_) {
                    Navigator.of(context).pop();
                    if (popTwoPages) {
                      Navigator.of(context).pop();
                    }
                  },
                ).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: color.textButton,
                        dismissDirection: DismissDirection.down,
                        showCloseIcon: true,
                        closeIconColor: color.textPrimary,
                        elevation: 5,
                        content: Text(
                          'Item deleted successfully!',
                          style: TextStyle(color: color.textPrimary),
                        ),
                      ),
                    ));
              },
              icon: Icons.delete,
              bgColor: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            SecondaryButtonDialog(
              buttonText: "Cancel",
              onPressedFunction: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
