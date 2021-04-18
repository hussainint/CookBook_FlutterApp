import 'dart:io';

class Items {
  final String title;
  final String description;
  final String servings;
  final String ingredients;
  final String category;
  final String recipe;
  final File img;

  Items({
    this.title,
    this.description,
    this.servings,
    this.ingredients,
    this.category,
    this.recipe,
    this.img,
  });
}
