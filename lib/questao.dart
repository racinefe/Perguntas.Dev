import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key, required TextStyle style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
