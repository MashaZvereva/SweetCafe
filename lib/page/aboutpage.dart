import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О нас'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Стрелка "Назад"
          onPressed: () {
            context.go('/'); // Переход на главную страницу
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Добавление картинки из интернета
          Image.network(
            'https://i.pinimg.com/1200x/6f/e2/97/6fe297e15779e19a0d4d4a467f4aa878.jpg',
          ),
          const SizedBox(height: 20),
          const Text(
            'Мы - лучшая кондитерская в городе!',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
