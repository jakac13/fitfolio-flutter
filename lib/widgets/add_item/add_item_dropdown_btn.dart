import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
import '../../models/categories.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

//* DrobdownButton mora biti stateful widget, ker bomo spreminjali njegovo stanje.
class AddItemDropdownButton extends StatefulWidget {
  const AddItemDropdownButton(
      {Key? key, required this.stringValueSetter, required this.disabled})
      : super(key: key);

  final Function(Category? value) stringValueSetter;

  final bool disabled;

  @override
  State<AddItemDropdownButton> createState() => _AddItemDropdownButtonState();
}

class _AddItemDropdownButtonState extends State<AddItemDropdownButton> {
  late Category _selectedCategory;

  List<DropdownMenuItem<Category>> get dropdownItems {
    return categories
        .map((category) => DropdownMenuItem<Category>(
              value: category,
              child: Text(category.name),
            ))
        .toList();
  }

  Category? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disabled,
      child: DropdownButtonFormField(
        items: dropdownItems,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            focusColor: color.textSecondary,
            prefixIcon: Icon(
              Icons.category_rounded,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: "Category",
            labelStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
            )),
        onChanged: (Category? newValue) {
          setState(() {
            _selectedValue = newValue!;

            widget.stringValueSetter(_selectedValue);
          });
        },
        validator: (value) {
          if (value == null) {
            return "Please select a category";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

//*Metoda, ki vrne polje (seznam) DropdownMenuItem widgetov
/* List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Other"), value: "Other"),
    DropdownMenuItem(child: Text("Hoodie"), value: "Hoodie"),
    DropdownMenuItem(child: Text("T-shirt"), value: "T-shirt"),
    DropdownMenuItem(child: Text("Shirt"), value: "Shirt"),
    DropdownMenuItem(child: Text("Sweater"), value: "Sweater"),
    DropdownMenuItem(child: Text("Jeans"), value: "Jeans"),
    DropdownMenuItem(child: Text("Pants"), value: "Pants"),
    DropdownMenuItem(child: Text("Shorts"), value: "Shorts"),
    DropdownMenuItem(child: Text("Sweatpants"), value: "Sweatpants"),
    DropdownMenuItem(child: Text("Jacket"), value: "Jacket"),
    DropdownMenuItem(child: Text("Coat"), value: "Coat"),
    DropdownMenuItem(child: Text("Skirt"), value: "Skirt"),
    DropdownMenuItem(child: Text("Dress"), value: "Dress"),
    DropdownMenuItem(child: Text("Blouse"), value: "Blouse"),
    DropdownMenuItem(child: Text("Shoes"), value: "Shoes"),
    DropdownMenuItem(child: Text("Boots"), value: "Boots"),
  ];
  return menuItems;
}
 */