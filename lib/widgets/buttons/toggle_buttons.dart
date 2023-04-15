import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/models/categories.dart';
import 'package:closet_assist/provider/category_provider.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

import '../../view_models/items_view_model.dart';

class ToggleButtonsWidget extends StatefulWidget {
  const ToggleButtonsWidget({super.key});

  @override
  State<ToggleButtonsWidget> createState() => _ToggleButtonsWidgetState();
}

class _ToggleButtonsWidgetState extends State<ToggleButtonsWidget> {
  List<bool> _isSelected = [];
  int _defaultIndex = 0;
  String categorySelected = "";

  @override
  void initState() {
    super.initState();
    _isSelected =
        List.generate(categories.length, (index) => index == _defaultIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      color: color.textPrimary,
      renderBorder: false,
      splashColor: Colors.transparent,
      fillColor: color.textButton,
      selectedColor: color.textButton,
      isSelected: _isSelected,
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < _isSelected.length; i++) {
            _isSelected[i] = i == index;
          }

          //*Tukaj izbrano kategorijo shranim v Category Provider, zato da jo bom lahko prenesel v main page v DisplayItemsWidget.
          //* Shranimo jo v provider, ker moramo to prenesti v parent widget (main page) in nato v DisplayItemsWidget parameter.
          Provider.of<CategoryProvider>(context, listen: false)
              .categorySelected = categories[index];
        });
      },
      children: categories
          .asMap()
          .map((index, category) => MapEntry(
                index,
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: color.textPrimary.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(40),
                      color:
                          _isSelected[index] ? color.textPrimary : Colors.white,
                    ),
                    width: 105,
                    alignment: Alignment.center,
                    child: Wrap(children: [
                      Text(
                        category.name,
                        style: TextStyle(
                            fontWeight: _isSelected[index]
                                ? FontWeight.w600
                                : FontWeight.normal),
                      ),
                    ]),
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }
}
