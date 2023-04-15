import 'package:closet_assist/widgets/items_display.dart';
import 'package:closet_assist/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

import '../widgets/buttons/toggle_buttons.dart';
import '../widgets/user_greeting_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        //*Če hočem da dela dark status bar, moram dat top in bottom false. To je nekej s sliverjem...
        top: false,
        bottom: false,
        child: SafeArea(
            child: CustomScrollView(
          primary: false,
          slivers: [
            const SliverAppBar(
              primary: true,
              automaticallyImplyLeading: false,
              pinned: false,
              title: UserGreetingWidget(),
              titleSpacing: 15,
              surfaceTintColor: Colors.white,
              shadowColor: color.textSecondary,
              expandedHeight: 10,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _ToggleButtonsDelegate(
                child: const ToggleButtonsWidget(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 5), // Add a gap of 10 pixels
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(
                child: const SearchBarWidget(),
              ),
            ),
            const ItemsDisplay()
          ],
        )));
  }
}

class _ToggleButtonsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _ToggleButtonsDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 10),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: child,
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SearchBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
        child: Row(
          children: [
            Expanded(child: child),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.filter_alt_outlined)
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
