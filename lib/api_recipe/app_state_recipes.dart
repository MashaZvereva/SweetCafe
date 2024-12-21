import 'package:mobx/mobx.dart';
import 'recipe_service.dart'; // Ваш сервис
import 'recipe.dart'; // Ваши модели рецептов

part 'app_state_recipes.g.dart';

class AppStateRecipes = _AppStateRecipes with _$AppStateRecipes;

abstract class _AppStateRecipes with Store {
  final RecipeService _recipeService = RecipeService();

  @observable
  ObservableList<Recipe> recipes = ObservableList<Recipe>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadRecipes(String query) async {
    isLoading = true;
    try {
      final fetchedRecipes = await _recipeService.fetchRecipes(query);
      recipes.clear();
      recipes.addAll(fetchedRecipes);
    } catch (e) {
      print("Error loading recipes: $e");
    } finally {
      isLoading = false;
    }
  }
}
