import 'package:flutter/material.dart';
import 'package:sweetcafe/page/recipe_page.dart';
import '../page/menupage.dart';
import '../page/aboutpage.dart';
import '../page/contactpage.dart';
import '../page/promotionspage.dart';
import '../page/reviewspage.dart';

class DesktopVersion extends StatefulWidget {
  const DesktopVersion({super.key});

  @override
  DesktopVersionState createState() => DesktopVersionState();
}

class DesktopVersionState extends State<DesktopVersion> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    MenuPage(),
    AboutPage(),
    ContactPage(),
    ReviewsPage(),
    PromotionsPage(),
    RecipePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Cafe - Desktop'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.desktop_windows, size: 40, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Добро пожаловать в Sweet Cafe на большом экране! Наслаждайтесь нашими десертами с удобством вашего компьютера.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: _pages[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,

    items: const [
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Меню'),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: 'О нас'),
    BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: 'Контакты'),
    BottomNavigationBarItem(icon: Icon(Icons.rate_review), label: 'Отзывы'),
    BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Акции'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Рецепты'),
    ],
    ),
    );
  }
}


