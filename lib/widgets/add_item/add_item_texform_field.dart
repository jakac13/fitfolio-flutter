import 'package:flutter/material.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class AddItemTextFormField extends StatelessWidget {
  const AddItemTextFormField(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.stringValueSetter,
      required this.enabled});

  final String labelText;
  final IconData icon;
  final bool enabled;

  final void Function(String value) stringValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabled: enabled,
          /* filled: true,
            fillColor: background, */
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          labelText: labelText,
          labelStyle: const TextStyle(color: color.textSecondary),
          prefixIcon: Icon(icon)),
      onChanged: (newValue) => stringValueSetter(newValue.toString()),
      //! Validator preveri če je textField prazen... V primeru, da je prazen String, napiše da je treba izpolniti vsa polja.
      validator: (value) {
        if (value == "") {
          return "Please fill the required fields.";
        } else {
          return null;
        }
      },
    );
  }
}
