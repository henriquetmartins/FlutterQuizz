import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  @required
  final List<Map<String, Object>> perguntas;
  @required
  final int perguntaDisponivel;
  @required
  final void Function(int) responder;

  Questionario({this.perguntas, this.perguntaDisponivel, this.responder});

  bool get temPerguntaDisponivel => perguntaDisponivel < perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaDisponivel
        ? perguntas[perguntaDisponivel]['respostas']
        : null;

    return Column(children: [
      Questao(perguntas[perguntaDisponivel]['pergunta']),
      ...respostas
          .map((resp) =>
              Resposta(resp['texto'], () => responder(resp['pontos'])))
          .toList()
    ]);
  }
}
