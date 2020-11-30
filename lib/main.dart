import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _pontuacaoTotal = 0;
  var _perguntaDisponivel = 0;

  final _perguntas = const [
    {
      'pergunta': 'Qual sua Cor preferida?',
      'respostas': [
        {'texto': 'Preto', 'pontos': 10},
        {'texto': 'Vermelho', 'pontos': 6},
        {'texto': 'Verde', 'pontos': 3},
        {'texto': 'Branco', 'pontos': 1},
      ]
    },
    {
      'pergunta': 'Qual o seu Animal favorito?',
      'respostas': [
        {'texto': 'Papagaio', 'pontos': 10},
        {'texto': 'Cachorro', 'pontos': 3},
        {'texto': 'Gato', 'pontos': 5},
        {'texto': 'Iguana', 'pontos': 7},
      ]
    },
    {
      'pergunta': 'Tamanho do Sapato?',
      'respostas': [
        {'texto': 'do 33 ao 36', 'pontos': 10},
        {'texto': 'do 36 ao 40', 'pontos': 5},
        {'texto': 'do 41 ao 44', 'pontos': 3},
        {'texto': 'maior que 44', 'pontos': 10},
      ]
    }
  ];

  void _responder(int pontos) {
    if (temPerguntaDisponivel) {
      setState(() {
        _perguntaDisponivel++;
        _pontuacaoTotal += pontos;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _pontuacaoTotal = 0;
      _perguntaDisponivel = 0;
    });
  }
  bool get temPerguntaDisponivel => _perguntaDisponivel < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quizz Toppen'),
      ),
      body: temPerguntaDisponivel
          ? Questionario(
              perguntaDisponivel: _perguntaDisponivel,
              perguntas: _perguntas,
              responder: _responder,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuiz),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
