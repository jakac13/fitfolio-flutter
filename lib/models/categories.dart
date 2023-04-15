import 'package:flutter/material.dart';

class Category {
  final String name;
  final List<Subcategory> subcategories;
  bool selected;

  Category(
      {required this.name,
      required this.subcategories,
      required this.selected});
}

class Subcategory {
  final String id;
  final String name;
  bool selected;
  Subcategory({required this.id, required this.name, required this.selected});
}

List<Category> categories = [
  Category(name: "All", subcategories: [], selected: true),
  Category(
      name: "Business",
      subcategories: [
        Subcategory(id: "1", name: "Suits", selected: false),
        Subcategory(id: "2", name: "Blouses", selected: false),
        Subcategory(id: "3", name: "Dress Shirts", selected: false),
        Subcategory(id: "4", name: "Dress Pants", selected: false),
        Subcategory(id: "5", name: "Sweaters", selected: false),
        Subcategory(id: "6", name: "Skirts", selected: false),
        Subcategory(id: "7", name: "Shoes", selected: false),
        Subcategory(id: "8", name: "Other", selected: false),
      ],
      selected: false),
  Category(
      name: "Casual",
      subcategories: [
        Subcategory(id: "9 ", name: "T-Shirts", selected: false),
        Subcategory(id: "10", name: "Jeans", selected: false),
        Subcategory(id: "11", name: "Shorts", selected: false),
        Subcategory(id: "12", name: "Hoodies", selected: false),
        Subcategory(id: "13", name: "Sweaters", selected: false),
        Subcategory(id: "14", name: "Sweatpants", selected: false),
        Subcategory(id: "15", name: "Shoes", selected: false),
        Subcategory(id: "16", name: "Other", selected: false),
      ],
      selected: false),
  Category(
      name: "Lingerie",
      subcategories: [
        Subcategory(id: "17", name: "Bras", selected: false),
        Subcategory(id: "18", name: "Panties", selected: false),
        Subcategory(id: "19", name: "Lingerie Sets", selected: false),
        Subcategory(id: "20", name: "Other", selected: false),
      ],
      selected: false),
  Category(
      name: "Sports",
      subcategories: [
        Subcategory(id: "21", name: "Shirts", selected: false),
        Subcategory(id: "22", name: "Shorts", selected: false),
        Subcategory(id: "23", name: "Sweatpants", selected: false),
        Subcategory(id: "24", name: "Leggings", selected: false),
        Subcategory(id: "25", name: "Shoes", selected: false),
        Subcategory(id: "26", name: "Other", selected: false),
      ],
      selected: false),
  Category(
      name: "Formal",
      subcategories: [
        Subcategory(id: "27", name: "Suits", selected: false),
        Subcategory(id: "28", name: "Dress Shirts", selected: false),
        Subcategory(id: "29", name: "Dress Pants", selected: false),
        Subcategory(id: "30", name: "Skirts", selected: false),
        Subcategory(id: "31", name: "Shoes", selected: false),
        Subcategory(id: "32", name: "Other", selected: false),
      ],
      selected: false),
];

Category? findCategoryByName(String name) {
  for (Category category in categories) {
    if (category.name == name) {
      return category;
    }
  }
  return null; // Return null if no matching Category is found
}
