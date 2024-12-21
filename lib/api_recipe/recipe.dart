import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class RecipeResponse {
  final List<Recipe>? meals;

  RecipeResponse({this.meals});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => _$RecipeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);
}

@JsonSerializable()
class Recipe {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strInstructions;

  Recipe({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.strInstructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
