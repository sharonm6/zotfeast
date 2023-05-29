class Recipe {
  String name;
  double cookTime; // in hours
  double price; // in dollars
  int servings;
  int calories; // in kcals
  List<String> ingredients;
  List<String> instructions;

  Recipe({
    this.name = '',
    this.cookTime = 0.0,
    this.price = 0,
    this.servings = 0,
    this.calories = 0,
    this.ingredients = const [],
    this.instructions = const [],
  });

  Recipe.fromData(Map<String, dynamic> data)
      : name = data['name'] ?? '',
        cookTime = data['cookTime'] ?? 0.0,
        price = data['price'] ?? 0,
        servings = data['servings'] ?? 0,
        calories = data['calories'] ?? 0,
        ingredients = data['ingredients'] ?? [],
        instructions = data['instructions'] ?? [];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cookTime': cookTime,
      'price': price,
      'servings': servings,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }
}
