import 'package:db_miner/screens/cat_auth.dart';
import 'package:db_miner/screens/details.dart';
import 'package:db_miner/screens/home_page.dart';
import 'package:db_miner/screens/quotes_page.dart';
import 'package:db_miner/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const HomePage(),
        'splash_screen': (context) => const SplashScreen(),
        'detail_page': (context) => const DetailsPage(),
        'category_and_auth': (context) => const CategoryOrAuthorPage(),
        'quote_page': (context) => const QuotesPage(),
      },
    ),
  );
}
