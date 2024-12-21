import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> menuItems = [];

  @override
  void initState() {
    super.initState();
    _loadMenuItems();
  }

  // Загрузка меню из локального хранилища
  void _loadMenuItems() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMenu = prefs.getStringList('menuItems') ?? [];
    setState(() {
      menuItems = savedMenu;
    });
  }

  // Сохранение меню в локальное хранилище
  void _saveMenuItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('menuItems', menuItems);
  }

  void _addMenuItem(String item) {
    setState(() {
      menuItems.add(item);
    });
    _saveMenuItems();
  }

  void _removeMenuItem(String item) {
    setState(() {
      menuItems.remove(item);
    });
    _saveMenuItems();
  }

  void _showAddMenuItemDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить элемент меню'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Название элемента'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  _addMenuItem(controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Добавить'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (String item in menuItems)
                  ListTile(
                    title: Text(item),
                    onLongPress: () => _removeMenuItem(item), // Удаление при долгом нажатии
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _showAddMenuItemDialog, // Открытие диалога добавления
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
