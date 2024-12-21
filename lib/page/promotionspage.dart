import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart'; // Импортируем нужный пакет
import '../mobx/app_state.dart'; // Путь к файлу с состоянием

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({super.key});

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  final AppState appState = AppState(); // Экземпляр AppState

  void _addPromotion(String promotion) {
    appState.addPromotion(promotion); // Добавляем акцию через MobX
  }

  void _removePromotion(String promotion) {
    appState.removePromotion(promotion); // Удаляем акцию через MobX
  }

  void _showAddPromotionDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить акцию'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Название акции'),
            keyboardType: TextInputType.text, // Поддержка ввода текста
            textInputAction: TextInputAction.done, // Завершение ввода
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[\\0-9]'))], // Опционально, если нужно запретить ввод цифр
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  _addPromotion(controller.text);
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
  void initState() {
    super.initState();
    appState.loadPromotions(); // Загрузка акций при инициализации страницы
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Акции'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Стрелка "Назад"
          onPressed: () {
            context.go('/'); // Переход на главную страницу
          },
        ),
      ),
      body: Observer( // Используем Observer для отслеживания изменений состояния
        builder: (_) {
          return ListView.builder(
            itemCount: appState.promotions.length,
            itemBuilder: (context, index) {
              final promotion = appState.promotions[index];
              return ListTile(
                title: Text(promotion),
                onLongPress: () => _removePromotion(promotion),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPromotionDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
