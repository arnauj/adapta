import 'dart:ffi';

import 'package:flutter/material.dart';

class HammingScreen extends StatelessWidget {
  const HammingScreen({super.key});

  static const String route = 'hamming';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Código Hamming"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _CajaDigito(
                  texto: "P1",
                  color: Color.fromARGB(255, 241, 178, 40),
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "P2",
                  color: Color.fromARGB(255, 241, 178, 40),
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "3",
                  color: Colors.grey,
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "P4",
                  color: Color.fromARGB(255, 241, 178, 40),
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "5",
                  color: Colors.grey,
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "6",
                  color: Colors.grey,
                  mostrarLinea: false,
                ),
                _CajaDigito(
                  texto: "7",
                  color: Colors.grey,
                  mostrarLinea: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _CajaDigito(
                  texto: "",
                  color: Colors.green,
                  colorLinea: Colors.green,
                  posLinea: 'L',
                ),
                _LineaCaja(color: Colors.green),
                _CajaDigito(
                  texto: "",
                  color: Colors.green,
                  colorLinea: Colors.green,
                ),
                _LineaCaja(color: Colors.green),
                _CajaDigito(
                  texto: "",
                  color: Colors.green,
                  colorLinea: Colors.green,
                ),
                _LineaCaja(color: Colors.green),
                _CajaDigito(
                  texto: "",
                  color: Colors.green,
                  colorLinea: Colors.green,
                  posLinea: 'R',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 150, width: 150),
                _CajaDigito(
                  texto: "",
                  color: Colors.red,
                  colorLinea: Colors.red,
                  posLinea: 'L',
                ),
                _CajaDigito(
                  texto: "",
                  color: Colors.red,
                  colorLinea: Colors.red,
                ),
                _LineaCaja(color: Colors.red),
                _LineaCaja(color: Colors.red),
                _CajaDigito(
                  texto: "",
                  color: Colors.red,
                  colorLinea: Colors.red,
                ),
                _CajaDigito(
                  texto: "",
                  color: Colors.red,
                  colorLinea: Colors.red,
                  posLinea: 'R',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 150, width: 150),
                SizedBox(height: 150, width: 150),
                SizedBox(height: 150, width: 150),
                _CajaDigito(
                  texto: "",
                  color: Colors.blue,
                  colorLinea: Colors.blue,
                  posLinea: 'L',
                ),
                _CajaDigito(
                  texto: "",
                  color: Colors.blue,
                  colorLinea: Colors.blue,
                ),
                _CajaDigito(
                  texto: "",
                  color: Colors.blue,
                  colorLinea: Colors.blue,
                ),
                _CajaDigito(
                  texto: "",
                  color: Colors.blue,
                  colorLinea: Colors.blue,
                  posLinea: 'R',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LineaCaja extends StatelessWidget {
  final Color color;

  const _LineaCaja({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 150,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

class _CajaDigito extends StatelessWidget {
  final Color color;
  final Color colorLinea;
  final String texto;
  final String posLinea;
  final bool mostrarLinea;

  const _CajaDigito({
    required this.color,
    required this.texto,
    this.colorLinea = Colors.grey,
    this.posLinea = 'C',
    this.mostrarLinea = true,
  });

  @override
  Widget build(BuildContext context) {
    double leftPos = 0;
    double rightPos = 0;
    if (posLinea == 'L') {
      leftPos = 40;
    }

    if (posLinea == 'R') {
      rightPos = 40;
    }

    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
        ),
        this.mostrarLinea
            ? Padding(
                padding: EdgeInsets.fromLTRB(leftPos, 70, rightPos, 70),
                child: Container(
                  color: colorLinea,
                  height: 15,
                  width: 150 - leftPos - rightPos,
                ),
              )
            : SizedBox(
                width: 150,
                height: 150,
              ),
        Padding(
          padding: EdgeInsets.all(35),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 80,
            width: 80,
            child: Center(child: Text(texto)),
          ),
        ),
      ],
    );
  }
}
