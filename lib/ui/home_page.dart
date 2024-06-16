import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Abner Escócio')),
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _profileTitle(),
            _profileSubtitle(),
            _profilePhoto(),
          ],
        ),
      ),
    );
  }

  Widget _profileTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Olá, seja bem-vindo(a) ao meu espaço",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _profileSubtitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Text(
        "Sou Desenvolvedor Mobile há mais de 7 anos com experiência maior na "
        "plataforma Android utilizando Kotlin, Flutter e Java; bem como, por "
        "vezes, TypeScript ou JavaScript para a construção de backends.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _profilePhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150.0),
      child: const FadeInImage(
        placeholder: AssetImage('assets/placeholder.png'),
        image: AssetImage('assets/profile_big.png'),
        fadeInDuration: Duration(seconds: 2),
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
