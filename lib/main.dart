import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // для проверки веб-платформы kIsWeb
import 'package:go_router/go_router.dart';
import 'package:sweetcafe/page/recipe_page.dart';
import 'version/mobile_version.dart';
import 'version/desktop_version.dart';
import 'version/web_version.dart';
import 'page/menupage.dart';
import 'page/aboutpage.dart';
import 'page/contactpage.dart';
import 'page/promotionspage.dart';
import 'page/reviewspage.dart';
import 'dart:io'; // Для использования Platform


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/menu',
        builder: (context, state) => const MenuPage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        path: '/reviews',
        builder: (context, state) => const ReviewsPage(),
      ),
      GoRoute(
        path: '/promotions',
        builder: (context, state) => const PromotionsPage(),
      ),
      GoRoute(
        path: '/recipe_page',
        builder: (context, state) => const  RecipePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sweet Cafe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const WebVersion();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return const MobileVersion();
    } else {
      return const DesktopVersion();
    }
  }
}
