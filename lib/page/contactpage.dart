import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.network(
            'https://www.softmagazin.ru/upload/pictures/Konsultacii-Zadat-vopros-auditory-6-Softmagazin.jpg',
          ),
          const SizedBox(height: 20),
          const Text(
            'Адрес: ул. Тверская, 10\nТелефон: +7 (925) 155-44-22',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
