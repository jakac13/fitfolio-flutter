/* import 'package:closet_assist/home/view/items_list_display_view.dart'; */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:closet_assist/models/item.dart';
import 'package:closet_assist/services/items_fetch_service.dart';
import 'package:closet_assist/view_models/items_view_model.dart';
import 'package:closet_assist/provider/search_query_provider.dart';
import 'package:closet_assist/provider/category_dropdown_btn_provider.dart';
import 'package:closet_assist/provider/category_provider.dart';
import 'package:closet_assist/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class ItemsDisplay extends StatefulWidget {
  const ItemsDisplay({super.key});

  @override
  State<ItemsDisplay> createState() => _ItemsDisplayState();
}

class _ItemsDisplayState extends State<ItemsDisplay> {
  final ItemsViewModel itemsList = ItemsViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchQueryProvider = Provider.of<SearchQueryProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: StreamBuilder<List<Item>>(
        stream: itemsList.getItemsStream(context, searchQueryProvider.search,
            categoryProvider.categorySelected),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Item> items = snapshot.data!;
            return SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 2.8 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: items.map((item) {
                return ItemCard(
                  item: item,
                  items: items,
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Text("Error fetching data!"));
          } else if (!snapshot.hasData) {
            return SliverToBoxAdapter(child: Image.asset("images/nodata.png"));
          } else {
            return const SliverToBoxAdapter(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
