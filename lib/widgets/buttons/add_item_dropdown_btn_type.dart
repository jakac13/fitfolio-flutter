import 'dart:developer';
import 'package:closet_assist/provider/category_dropdown_btn_provider.dart';
import 'package:closet_assist/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//*Firebase
import 'package:firebase_auth/firebase_auth.dart';

//*Pages
import 'package:closet_assist/pages/register_page.dart';

import 'package:google_fonts/google_fonts.dart';

//*Widgets
import 'package:closet_assist/widgets/my_drawer.dart';
import 'package:closet_assist/widgets/my_drawer_list.dart';
import 'package:closet_assist/widgets/buttons/primary_btn_dialog.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn_dialog.dart';
import 'package:closet_assist/widgets/add_item/add_item_texform_field.dart';

//*Classes
import 'package:closet_assist/models/item.dart';
import 'package:closet_assist/models/categories.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class AddItemDropdownTypeButton extends StatefulWidget {
  const AddItemDropdownTypeButton(
      {super.key, required this.disabled, required this.stringValueSetter});

  final void Function(Subcategory? value) stringValueSetter;
  final bool disabled;

  @override
  State<AddItemDropdownTypeButton> createState() =>
      _AddItemDropdownTypeButtonState();
}

class _AddItemDropdownTypeButtonState extends State<AddItemDropdownTypeButton> {
  late Subcategory _selectedSubcategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Subcategory> _subcategories = [];
    return Consumer<CategoryDropdownBtnProvider>(
      builder: (context, categoryProvider, _) {
        final selectedCategoryName = categoryProvider.categorySelected;

        final selectedCategory = categories.firstWhere(
          (category) => category == selectedCategoryName,
          orElse: () => categories.first,
        );
        final selectedSubcategories = selectedCategory.subcategories;
        _subcategories = selectedSubcategories;
        final dropdownItems = _subcategories
            .map((subcategory) => DropdownMenuItem<String>(
                  value: _subcategories.indexOf(subcategory).toString(),
                  child: Text(subcategory.name),
                ))
            .toList();

        String? selectedValue;

        return DropdownButtonFormField(
          items: dropdownItems,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              focusColor: color.textSecondary,
              prefixIcon: Icon(Icons.category_rounded),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: "Type",
              labelStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
              )),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
              _selectedSubcategory = _subcategories[int.parse(selectedValue!)];
              widget.stringValueSetter(_selectedSubcategory);
            });
          },
          validator: (value) {
            if (value == null) {
              return "Please select item type.";
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
