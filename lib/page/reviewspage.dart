import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final List<String> reviews = [
    "Очень вкусные торты!",
    "Обслуживание на высоте.",
    "Пекарня супер!",
    "Очень люблю вашу выпечку!"];

  void _addReview(String review) {
    setState(() {
      reviews.add(review);
    });
  }

  void _removeReview(String review) {
    setState(() {
      reviews.remove(review);
    });
  }

  void _showAddReviewDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить отзыв'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Ваш отзыв'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  _addReview(controller.text);
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
        title: const Text('Отзывы'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            title: Text(review),
            onLongPress: () => _removeReview(review),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddReviewDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}