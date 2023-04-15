import 'package:cached_network_image/cached_network_image.dart';
import 'package:closet_assist/view_models/item_user_interaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//*Colors
import 'package:closet_assist/constants/colors.dart' as color;
import 'package:google_fonts/google_fonts.dart';

import '../models/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.items});

  final Item item;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Consumer<ItemUserInteractionViewModel>(
        builder: (context, ref, child) {
          return InkWell(
            enableFeedback: true,
            borderRadius: BorderRadius.circular(10),
            onTapDown: (details) => ref.handleTapDown(details, context),
            onTap: () {
              ref.handleTap(item, context);
            },
            onLongPress: () {
              ref.handleLongPressDown(item, context);
            },
            child: Hero(
              tag: item.uid,
              child: Card(
                margin: const EdgeInsets.all(0),
                color: color.bgCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                shadowColor: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Stack(children: [
                          CachedNetworkImage(
                            progressIndicatorBuilder: (context, url, progress) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 68, vertical: 60),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  color: Color.fromARGB(33, 3, 0, 3),
                                ),
                              );
                            },
                            imageUrl: item.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorWidget: (context, url, error) =>
                                const Text("Error when loading the image."),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: item.color,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name.toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                color: color.textPrimary,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.subcategory,
                            style: GoogleFonts.poppins(
                                fontSize: 12.0, color: color.textPrimary),
                          ),
                          Text(
                            item.category,
                            style: GoogleFonts.poppins(
                                fontSize: 12.0, color: color.textPrimary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
