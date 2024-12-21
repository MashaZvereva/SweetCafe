import 'package:flutter/material.dart';
import '../page/recipe_page.dart';
import '../page/menupage.dart';
import '../page/aboutpage.dart';
import '../page/contactpage.dart';
import '../page/promotionspage.dart';
import '../page/reviewspage.dart';

class WebVersion extends StatelessWidget {
  const WebVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Cafe - Web'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.web, size: 40, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Добро пожаловать в Sweet Cafe онлайн! Сладости доступны везде, где есть интернет.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.menu_book, color: Colors.green),
                title: const Text('Меню'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.green),
                title: const Text('О нас'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('Контакты'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactPage()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.reviews, color: Colors.green),
                title: const Text('Отзывы'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReviewsPage()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.green),
                title: const Text('Акции'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PromotionsPage()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.menu_book, color: Colors.green),
                title: const Text('Рецепты'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RecipePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
