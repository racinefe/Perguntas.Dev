import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final void Function(String) selecionarTema;

  const HomePage({super.key, required this.selecionarTema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um Tema para responder'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg4.gif'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => selecionarTema('javaScript'),
                child: const Text('JavaScript'),
              ),
              ElevatedButton(
                onPressed: () => selecionarTema('HTML'),
                child: const Text('HTML'),
              ),
              ElevatedButton(
                onPressed: () => selecionarTema('Angular'),
                child: const Text('Angular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
