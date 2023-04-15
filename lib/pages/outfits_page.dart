import 'package:flutter/material.dart';

class OutfitsPage extends StatelessWidget {
  const OutfitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "OUTFITS",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
