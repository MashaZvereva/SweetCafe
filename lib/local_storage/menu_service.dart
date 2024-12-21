import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'menu.dart';

class MenuService {
  static const String _menuKey = 'menu_key';

  // Сохранить меню в локальное хранилище
  Future<void> saveMenu(List<Menu> menu) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> menuJson = menu.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_menuKey, menuJson);
  }

  // Загрузить меню из локального хранилища
  Future<List<Menu>> loadMenu() async {
    final prefs = await SharedPreferences.getInstance();
    final menuJson = prefs.getStringList(_menuKey);
    if (menuJson != null) {
      return menuJson.map((jsonStr) => Menu.fromJson(jsonDecode(jsonStr))).toList();
    }
    return [];
  }
}
