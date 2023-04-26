
import 'package:flutter/material.dart';

class Category {
  Category(this.title, this.items);

  final String title;
  final List<CategoryItem> items;
}

class CategoryItem {
  CategoryItem(this.title, this.subtitle, this.screen);

  final String title;
  final String subtitle;
  final Widget screen;
}
