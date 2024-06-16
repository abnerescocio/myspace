import 'package:flutter/material.dart';
import 'package:myspace/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abner Escócio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        // '/about': (context) => AboutPage(),
        // '/projects': (context) => ProjectsPage(),
        // '/contact': (context) => ContactPage(),
      },
    );
  }
}
