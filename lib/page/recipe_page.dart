import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../api_recipe/app_state_recipes.dart'; // Используйте правильный AppState
import '../api_recipe/recipe.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final AppStateRecipes appState = AppStateRecipes(); // Используем AppState для рецептов

  @override
  void initState() {
    super.initState();
    appState.loadRecipes('cake'); // Пример запроса рецептов
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наши рецепты выпечки'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Стрелка "Назад"
          onPressed: () {
            context.go('/'); // Переход на главную страницу
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (appState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (appState.recipes.isEmpty) {
            return const Center(child: Text('Нет рецептов для отображения.'));
          }

          return ListView.builder(
            itemCount: appState.recipes.length,
            itemBuilder: (context, index) {
              final Recipe recipe = appState.recipes[index];
              return ListTile(
                title: Text(recipe.strMeal),
                subtitle: Text(recipe.strInstructions),
                leading: Image.network(recipe.strMealThumb),
                onTap: () {
                  // Открыть подробности рецепта
                },
              );
            },
          );
        },
      ),
    );
  }
}
