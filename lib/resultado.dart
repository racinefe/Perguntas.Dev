import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(
      {super.key, this.pontuacao = 0, required this.reiniciarQuestionario});

  String get frasePontuacao {
    if (pontuacao <= 5) {
      return 'Precisa estudar mais';
    } else if (pontuacao <= 20) {
      return 'Parabéns, mas precisa melhorar!';
    } else if (pontuacao <= 35) {
      return 'Mandou Bem!';
    } else if (pontuacao <= 40) {
      return 'Incrível, mandou Bem!';
    } else if (pontuacao <= 45) {
      return 'Excelente!';
    } else if (pontuacao <= 49) {
      return 'Excelente, mandou Bem!';
    } else {
      // pontuacao == 50
      return 'Um mestre Jedi você é, Yoda muito feliz está!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: const Color.fromARGB(255, 7, 6, 70).withOpacity(0.8),
          margin: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 15.0), // Margens ao redor do card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Pontuação: $pontuacao\n$frasePontuacao',
                style: const TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 255, 13),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciarQuestionario,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 162, 255),
          ),
          child: const Text(
            'Reiniciar',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    );
  }
}
