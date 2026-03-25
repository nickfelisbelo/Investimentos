import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double valor = 0.0;
  double juros = 0.0;
  double meses = 0;
  double valorSemJuros = 0.0;
  double valorComJuros = 0.0;
  String resultado = "";

  void calcular() {
    valorSemJuros = valor * meses;
    valorComJuros =
        valor * (pow((1 + (juros / 100)), meses) - 1) / (juros / 100);
    resultado =
        "Valor total sem juros : \$ ${valorSemJuros.toStringAsFixed(2)}\nValor total com juros compostos : \$ ${valorComJuros.toStringAsFixed(2)}";
  }

  void alert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Simulador de Investimentos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 61, 34),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              Text(
                "Investimento Mensal:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 33, 61, 34),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Digite o valor",
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 33, 61, 34),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0, // Espessura
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  valor = double.parse(value);
                },
              ),
              Text(
                "Numero de Meses:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 33, 61, 34),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Número de meses",
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 33, 61, 34),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0, // Espessura
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  meses = double.parse(value);
                },
              ),
              Text(
                "Taxa de Juros ao mes:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 33, 61, 34),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Digite a taxa de juros",
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 33, 61, 34),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0, // Espessura
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 33, 61, 34),
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  juros = double.parse(value);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 61, 34),
                ),
                onPressed: () {
                  calcular();
                  alert(context, resultado);
                },
                child: Text("Simular", style: TextStyle(color: Colors.white)),
              ),
              Center(
                child: Text(
                  "Valor total sem juros : \$ ${valorSemJuros.toStringAsFixed(2)}\nValor total com juros compostos : \$ ${valorComJuros.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 33, 61, 34),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
