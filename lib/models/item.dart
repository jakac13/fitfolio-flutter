import 'package:flutter/material.dart';

class Item {
  String _uid = "";
  final String _name;
  final String _category;
  final String _subcategory;
  final String _image;
  final Color? _color;
  final DateTime _timestamp;

  //* [] v konstruktorju pomeni da je optional argument.

  Item(this._uid, this._name, this._category, this._subcategory, this._image,
      this._color,
      [DateTime? timestamp])
      : _timestamp = timestamp ?? DateTime.now();

  Item.nouid(
      this._name, this._category, this._subcategory, this._image, this._color,
      [DateTime? timestamp])
      : _timestamp = timestamp ?? DateTime.now();

  String get uid => _uid;

  String get name => _name;
  /* set name(String value) {
    _name = value;
  } */

  String get category => _category;
  String get subcategory => _subcategory;
  Color? get color => _color;
  /* set category(String value) {
    _category = value;
  } */

  String get image => _image;
  /* set image(String value) {
    _image = value;
  } */

  DateTime get timestamp => _timestamp;
}
