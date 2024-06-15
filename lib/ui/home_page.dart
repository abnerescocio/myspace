import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/abner.png'),
        ),
        title: const Text('Abner Escócio'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/projects');
            },
            child: const Text('Projetos'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            child: const Text('Contato'),
          ),
        ],
      ),
    );
  }
}
