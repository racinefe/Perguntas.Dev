import 'dart:math';

import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
import './home_page.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  bool _mostrarQuestionario = false;
  List<Map<String, Object>> _perguntasAleatorias =
      []; // Lista de perguntas aleatórias
  final Map<String, List<Map<String, Object>>> _perguntasPorTema = {
    'javaScript': [
      {
        'texto': 'Qual é a saída do código console.log(typeof NaN);?',
        'respostas': [
          {'texto': 'A) undefined', 'pontuacao': 0},
          {'texto': 'B) number', 'pontuacao': 05},
          {'texto': 'C) NaN', 'pontuacao': 0},
          {'texto': 'D) object', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual método é usado para adicionar um elemento ao final de um array em JavaScript?',
        'respostas': [
          {'texto': 'A) push()', 'pontuacao': 05},
          {'texto': 'B) pop()', 'pontuacao': 0},
          {'texto': 'C) shift()', 'pontuacao': 0},
          {'texto': 'D) unshift()', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual é o resultado de 0.1 + 0.2 === 0.3 em JavaScript?',
        'respostas': [
          {'texto': 'A) true', 'pontuacao': 0},
          {'texto': 'B) false', 'pontuacao': 05},
          {'texto': 'C) undefined', 'pontuacao': 0},
          {'texto': 'D) NaN', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual palavra-chave é usada para criar uma constante em JavaScript?',
        'respostas': [
          {'texto': 'A) var', 'pontuacao': 0},
          {'texto': 'B) let', 'pontuacao': 0},
          {'texto': 'C) const', 'pontuacao': 05},
          {'texto': 'D) static', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual é a diferença entre == e === em JavaScript?',
        'respostas': [
          {
            'texto':
                'A) == compara valores e tipos, === compara apenas valores',
            'pontuacao': 0
          },
          {
            'texto':
                'B) == compara apenas valores, === compara valores e tipos',
            'pontuacao': 05
          },
          {
            'texto':
                'C) == é usado para comparação de strings, === para números',
            'pontuacao': 0
          },
          {
            'texto': 'D) == é usado para números, === para strings',
            'pontuacao': 0
          },
        ],
      },
      {
        'texto': 'Qual é a saída do código console.log([] + []);?',
        'respostas': [
          {'texto': 'A) " " (string vazia)', 'pontuacao': 05},
          {'texto': 'B) [ ] (array vazio)', 'pontuacao': 0},
          {'texto': 'C) undefined', 'pontuacao': 0},
          {'texto': 'D) NaN', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual das seguintes é uma estrutura de controle de fluxo em JavaScript?',
        'respostas': [
          {'texto': 'A) if', 'pontuacao': 0},
          {'texto': 'B) for', 'pontuacao': 0},
          {'texto': 'C) switch', 'pontuacao': 0},
          {'texto': 'D) Todas as anteriores', 'pontuacao': 05},
        ],
      },
      {
        'texto':
            'Qual das seguintes opções é um exemplo de função anônima em JavaScript?',
        'respostas': [
          {'texto': 'A) function myFunction() {}', 'pontuacao': 0},
          {'texto': 'B) (function() {})()', 'pontuacao': 05},
          {'texto': 'C) let x = function namedFunc() {}', 'pontuacao': 0},
          {'texto': 'D) let x = 10;', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'O que o método Array.prototype.map() faz?',
        'respostas': [
          {
            'texto':
                'A) Modifica o array original aplicando uma função a cada elemento',
            'pontuacao': 0
          },
          {
            'texto':
                'B) Retorna um novo array com os resultados de aplicar uma função a cada elemento',
            'pontuacao': 05
          },
          {
            'texto': 'C) Encontra o índice de um elemento em um array',
            'pontuacao': 0
          },
          {
            'texto': 'D) Remove o primeiro elemento de um array',
            'pontuacao': 0
          },
        ],
      },
      {
        'texto': 'Qual é o valor de null em JavaScript?',
        'respostas': [
          {'texto': 'A) Um valor numérico', 'pontuacao': 0},
          {'texto': 'B) Um objeto', 'pontuacao': 05},
          {'texto': 'C) Um tipo de dado indefinido', 'pontuacao': 0},
          {'texto': 'D) Uma string vazia', 'pontuacao': 0},
        ],
      },
    ],
    'HTML': [
      {
        'texto': 'Qual é a tag HTML usada para criar um parágrafo?',
        'respostas': [
          {'texto': 'A) <p>', 'pontuacao': 05},
          {'texto': 'B) <div>', 'pontuacao': 0},
          {'texto': 'C) <span>', 'pontuacao': 0},
          {'texto': 'D) <a>', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual atributo é usado para fornecer um texto alternativo para uma imagem se ela não puder ser exibida?',
        'respostas': [
          {'texto': 'A) title', 'pontuacao': 0},
          {'texto': 'B) src', 'pontuacao': 0},
          {'texto': 'C) alt', 'pontuacao': 05},
          {'texto': 'D) href', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual é a tag correta para criar um link em HTML?',
        'respostas': [
          {'texto': 'A) <a href="url">Texto do link</a>', 'pontuacao': 05},
          {'texto': 'B) <link href="url">Texto do link</link>', 'pontuacao': 0},
          {'texto': 'C) <url="link">Texto do link</url>', 'pontuacao': 0},
          {
            'texto': 'D) <anchor href="url">Texto do link</anchor>',
            'pontuacao': 0
          },
        ],
      },
      {
        'texto':
            'Qual tag HTML é usada para definir o cabeçalho de uma tabela?',
        'respostas': [
          {'texto': 'A) <th>', 'pontuacao': 05},
          {'texto': 'B) <tr>', 'pontuacao': 0},
          {'texto': 'C) <td>', 'pontuacao': 0},
          {'texto': 'D) <thead>', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual é a tag HTML correta para inserir uma quebra de linha?',
        'respostas': [
          {'texto': 'A) <br>', 'pontuacao': 05},
          {'texto': 'B) <hr>', 'pontuacao': 0},
          {'texto': 'C) <break>', 'pontuacao': 0},
          {'texto': 'D) <line>', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual atributo HTML é usado para definir o texto que aparece quando o ponteiro do mouse passa sobre um elemento?',
        'respostas': [
          {'texto': 'A) title', 'pontuacao': 05},
          {'texto': 'B) tooltip', 'pontuacao': 0},
          {'texto': 'C) hover', 'pontuacao': 0},
          {'texto': 'D) alt', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual tag HTML é usada para criar uma lista ordenada?',
        'respostas': [
          {'texto': 'A) <ul>', 'pontuacao': 0},
          {'texto': 'B) <ol>', 'pontuacao': 05},
          {'texto': 'C) <li>', 'pontuacao': 0},
          {'texto': 'D) <dl>', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual tag HTML é usada para adicionar uma imagem a uma página?',
        'respostas': [
          {'texto': 'A) <img>', 'pontuacao': 05},
          {'texto': 'B) <image>', 'pontuacao': 0},
          {'texto': 'C) <pic>', 'pontuacao': 0},
          {'texto': 'D) <src>', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual elemento HTML é usado para especificar um rodapé para um documento ou uma seção?',
        'respostas': [
          {'texto': 'A) <footer>', 'pontuacao': 05},
          {'texto': 'B) <bottom>', 'pontuacao': 0},
          {'texto': 'C) <end>', 'pontuacao': 0},
          {'texto': 'D) <foot>', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual é a tag HTML correta para criar um campo de entrada de texto em um formulário?',
        'respostas': [
          {'texto': 'A) <input type="text">', 'pontuacao': 05},
          {'texto': 'B) <textarea>', 'pontuacao': 0},
          {'texto': 'C) <textbox>', 'pontuacao': 0},
          {'texto': 'D) <textinput>', 'pontuacao': 0},
        ],
      },
    ],
    'Angular': [
      {
        'texto':
            'Qual comando é usado para criar um novo projeto Angular usando o Angular CLI?',
        'respostas': [
          {'texto': 'A) ng new', 'pontuacao': 05},
          {'texto': 'B) ng create', 'pontuacao': 0},
          {'texto': 'C) ng start', 'pontuacao': 0},
          {'texto': 'D) ng init', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual diretiva Angular é usada para renderizar elementos com base em uma expressão booleana?',
        'respostas': [
          {'texto': 'A) *ngFor', 'pontuacao': 0},
          {'texto': 'B) *ngIf', 'pontuacao': 05},
          {'texto': 'C) *ngSwitch', 'pontuacao': 0},
          {'texto': 'D) *ngModel', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual é o propósito do módulo AppModule em um projeto Angular?',
        'respostas': [
          {'texto': 'A) Definir o roteamento da aplicação', 'pontuacao': 0},
          {'texto': 'B) Configurar os serviços da aplicação', 'pontuacao': 0},
          {
            'texto':
                'C) Declarar componentes, diretivas e pipes usados na aplicação',
            'pontuacao': 05
          },
          {'texto': 'D) Configurar o servidor backend', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual comando é usado para gerar um novo componente em um projeto Angular?',
        'respostas': [
          {'texto': 'A) ng add component', 'pontuacao': 0},
          {'texto': 'B) ng generate component', 'pontuacao': 05},
          {'texto': 'C) ng make component', 'pontuacao': 0},
          {'texto': 'D) ng create component', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual é o ciclo de vida de um componente Angular que é chamado após a criação e inicialização do componente?',
        'respostas': [
          {'texto': 'A) ngOnDestroy', 'pontuacao': 0},
          {'texto': 'B) ngOnInit', 'pontuacao': 05},
          {'texto': 'C) ngAfterViewInit', 'pontuacao': 0},
          {'texto': 'D) ngDoCheck', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual é a funcionalidade principal do serviço HttpClient em Angular?',
        'respostas': [
          {'texto': 'A) Manipular o DOM', 'pontuacao': 0},
          {
            'texto': 'B) Realizar requisições HTTP para servidores remotos',
            'pontuacao': 05
          },
          {'texto': 'C) Configurar rotas', 'pontuacao': 0},
          {'texto': 'D) Gerenciar estados da aplicação', 'pontuacao': 0},
        ],
      },
      {
        'texto': 'Qual decorador é usado para definir um serviço em Angular?',
        'respostas': [
          {'texto': 'A) @Component', 'pontuacao': 0},
          {'texto': 'B) @Directive', 'pontuacao': 0},
          {'texto': 'C) @Injectable', 'pontuacao': 05},
          {'texto': 'D) @Pipe', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Como você pode passar dados de um componente pai para um componente filho em Angular?',
        'respostas': [
          {'texto': 'A) @Injectable()', 'pontuacao': 0},
          {'texto': 'B) @Input()', 'pontuacao': 05},
          {'texto': 'C) @Output()', 'pontuacao': 0},
          {'texto': 'D) @Component()', 'pontuacao': 0},
        ],
      },
      {
        'texto':
            'Qual diretiva é usada para criar um formulário reativo em Angular?',
        'respostas': [
          {'texto': 'A) ngModel', 'pontuacao': 0},
          {'texto': 'B) ngForm', 'pontuacao': 0},
          {'texto': 'C) formControlName', 'pontuacao': 0},
          {'texto': 'D) formGroup', 'pontuacao': 05},
        ],
      },
      {
        'texto':
            'Qual comando é usado para compilar e servir uma aplicação Angular em desenvolvimento?',
        'respostas': [
          {'texto': 'A) ng compile', 'pontuacao': 0},
          {'texto': 'B) ng build', 'pontuacao': 0},
          {'texto': 'C) ng serve', 'pontuacao': 05},
          {'texto': 'D) ng deploy', 'pontuacao': 0},
        ],
      },
    ],
  };

  void _selecionarTema(String tema) {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
      _mostrarQuestionario = true;

      // Embaralha as perguntas ao selecionar o tema
      _perguntasAleatorias = List.from(_perguntasPorTema[tema]!);
      _perguntasAleatorias.shuffle(Random());
    });
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;

      _mostrarQuestionario = false;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntasAleatorias.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Perguntas.Dev'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg6.gif'), fit: BoxFit.cover),
          ),
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild: HomePage(selecionarTema: _selecionarTema),
            secondChild: temPerguntaSelecionada
                ? Questionario(
                    perguntaSelecionada: _perguntaSelecionada,
                    perguntas: _perguntasAleatorias,
                    responder: _responder,
                  )
                : Resultado(
                    pontuacao: _pontuacaoTotal,
                    reiniciarQuestionario: _reiniciarQuestionario,
                  ),
            crossFadeState: _mostrarQuestionario
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
