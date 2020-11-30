import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function reiniciarQuiz;

  Resultado(this.pontuacao, this.reiniciarQuiz);

  String get fraseResultado {
    if (pontuacao < 11) {
      return 'Parabéns';
    } else if (pontuacao < 18) {
      return 'Foi bem';
    } else if (pontuacao < 23) {
      return 'Tu é zika';
    }
    return 'MOOOOOOONSTRO';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 35)),
        ),
        FlatButton(
          child: Text(
            'Reiniciar Quizz?',
            style: TextStyle(fontSize: 15,
            color: Colors.blue,
            ),
          ),
          onPressed: reiniciarQuiz,
        )
      ],
    );
  }
}
