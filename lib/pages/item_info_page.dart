import 'package:closet_assist/services/items_delete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/item.dart';
import '../provider/selected_item_index.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

import '../widgets/delete_alert_dialog.dart';

class ItemInfoPage extends StatefulWidget {
  final Item item;
  const ItemInfoPage({super.key, required this.item});

  @override
  State<ItemInfoPage> createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  @override
  Widget build(BuildContext context) {
    //* Variables
    final themeOf = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            final deleteItemDialog = DeleteItemAlertDialog(
              popTwoPages: true,
            );
            deleteItemDialog.show(context, widget.item);
          },
          icon: const Icon(Icons.delete_forever),
        )
      ], automaticallyImplyLeading: true, foregroundColor: Colors.black),
      body: Column(
        /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Hero(
            tag: widget.item.uid,
            child: CachedNetworkImage(
              imageUrl: widget.item.image,
              fit: BoxFit.cover,
            ),
          )),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name.toUpperCase(),
                  style: themeOf.titleLarge,
                ),
                Text(
                  "Category: ${widget.item.category}",
                  style: themeOf.bodyLarge,
                ),
                Text(
                  "Type: ${widget.item.subcategory}",
                  style: themeOf.bodyLarge,
                ),
                Text(
                  "Added on: ${widget.item.timestamp.toString().substring(0, 19)}",
                  style: themeOf.bodyLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
