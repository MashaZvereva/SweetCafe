import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe.dart';

class RecipeService {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<List<Recipe>> fetchRecipes(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'] ?? [];
      return meals.map((meal) => Recipe.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
