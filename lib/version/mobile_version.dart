import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileVersion extends StatelessWidget {
  const MobileVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Cafe - Mobile'),
        centerTitle: true,
        // Убираем стрелку "Назад", удаляя этот блок:
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     context.go('/'); // Переход на главную страницу
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android, size: 40, color: Colors.pink),
                SizedBox(width: 10),
                Text(
                  'Добро пожаловать в Sweet Cafe - Mobile!',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.menu_book, color: Colors.pink),
                title: const Text('Меню'),
                onTap: () {
                  context.go('/menu'); // Перейти к меню
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.pink),
                title: const Text('О нас'),
                onTap: () {
                  context.go('/about');  // Переход к странице "О нас"
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.pink),
                title: const Text('Контакты'),
                onTap: () {
                  context.go('/contact');  // Переход к странице "Контакты"
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.reviews, color: Colors.pink),
                title: const Text('Отзывы'),
                onTap: () {
                  context.go('/reviews');  // Переход к странице "Отзывы"
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.pink),
                title: const Text('Акции'),
                onTap: () {
                  context.go('/promotions'); // Переход к странице "Акции"
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.menu_book, color: Colors.pink),
                title: const Text('Рецепты'),
                onTap: () {
                  context.go('/recipe_page'); // Переход к странице "Рецепты"
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
