import 'package:flutter/material.dart';
import 'package:perguntas_dev/questao.dart';
import 'package:perguntas_dev/respostas.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada &&
            perguntas[perguntaSelecionada]['respostas'] != null
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      child: Column(
        key: ValueKey<int>(perguntaSelecionada),
        children: <Widget>[
          Card(
            color: const Color.fromARGB(255, 195, 198, 204),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Questao(
                perguntas[perguntaSelecionada]['texto'].toString(),
                style: const TextStyle(),
              ),
            ),
          ),
          ...respostas.map((resp) {
            return Respostas(
              resp['texto'].toString(),
              () => responder(int.parse(resp['pontuacao'].toString())),
            );
          }),
        ],
      ),
    );
  }
}
