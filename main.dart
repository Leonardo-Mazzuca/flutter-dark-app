// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Gestão de abrigos")),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: abrigos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CardAbrigo(abrigo: abrigos[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardAbrigo extends StatefulWidget {
  CardAbrigo({super.key, required this.abrigo});

  Abrigo abrigo;

  @override
  State<CardAbrigo> createState() => _CardAbrigoState();
}

class _CardAbrigoState extends State<CardAbrigo> {
  void aumentarCapacidade() {
    setState(() {
      bool isFull =
          widget.abrigo.capacidadeAtual >= widget.abrigo.capacidadeMaxima;
      if (isFull) {
        widget.abrigo.estaAberto = false;
      } else {
        widget.abrigo.capacidadeAtual++;
      }
    });
  }

  void diminuirCapacidade() {
    setState(() {
      widget.abrigo.capacidadeAtual--;
      if (widget.abrigo.capacidadeAtual < 0) {
        widget.abrigo.capacidadeAtual = 0;
      }
      bool isFull =
          widget.abrigo.capacidadeAtual >= widget.abrigo.capacidadeMaxima;
      if (!isFull) {
        widget.abrigo.estaAberto = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.abrigo.nome,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.abrigo.estaAberto ? "Aberto" : "Fechado",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: widget.abrigo.estaAberto
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    Icon(
                      widget.abrigo.estaAberto
                          ? Icons.check_circle_outline
                          : Icons.cancel,
                      color: widget.abrigo.estaAberto
                          ? Colors.green
                          : Colors.red,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  widget.abrigo.endereco,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantidade atual: ${widget.abrigo.capacidadeAtual}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Quantidade máxima: ${widget.abrigo.capacidadeMaxima}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            CardButtons(
              aumentarCapacidade: aumentarCapacidade,
              diminuirCapacidade: diminuirCapacidade,
            ),
          ],
        ),
      ),
    );
  }
}

class CardButtons extends StatelessWidget {
  CardButtons({
    super.key,
    required this.aumentarCapacidade,
    required this.diminuirCapacidade,
  });

  Function aumentarCapacidade;
  Function diminuirCapacidade;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalDivider(color: Colors.black45, thickness: 2),
        Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () {
                aumentarCapacidade();
              },
              icon: Icon(Icons.add, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                diminuirCapacidade();
              },
              icon: Icon(Icons.remove, color: Colors.redAccent),
            ),
          ],
        ),
      ],
    );
  }
}

class Abrigo {
  String nome;
  String endereco;
  int capacidadeMaxima;
  int capacidadeAtual;
  bool estaAberto;

  Abrigo({
    required this.nome,
    required this.endereco,
    required this.capacidadeMaxima,
    required this.capacidadeAtual,
    required this.estaAberto,
  });
}

List<Abrigo> abrigos = [
  Abrigo(
    nome: "Abrigo A",
    endereco: "Rua A, 123",
    capacidadeMaxima: 50,
    capacidadeAtual: 30,
    estaAberto: true,
  ),
  Abrigo(
    nome: "Abrigo B",
    endereco: "Rua B, 456",
    capacidadeMaxima: 100,
    capacidadeAtual: 80,
    estaAberto: false,
  ),
  Abrigo(
    nome: "Abrigo C",
    endereco: "Rua C, 789",
    capacidadeMaxima: 75,
    capacidadeAtual: 60,
    estaAberto: true,
  ),
  Abrigo(
    nome: "Abrigo D",
    endereco: "Rua D, 789",
    capacidadeMaxima: 75,
    capacidadeAtual: 60,
    estaAberto: true,
  ),
  Abrigo(
    nome: "Abrigo E",
    endereco: "Rua E, 789",
    capacidadeMaxima: 75,
    capacidadeAtual: 60,
    estaAberto: true,
  ),
  Abrigo(
    nome: "Abrigo F",
    endereco: "Rua F, 789",
    capacidadeMaxima: 75,
    capacidadeAtual: 60,
    estaAberto: false,
  ),
  Abrigo(
    nome: "Abrigo G",
    endereco: "Rua G, 789",
    capacidadeMaxima: 75,
    capacidadeAtual: 60,
    estaAberto: false,
  ),
];
