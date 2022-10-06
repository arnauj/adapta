import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/providers/providers.dart';

class HammingScreen extends StatelessWidget {
  const HammingScreen({super.key});

  static const String route = 'hamming';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 6;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Hamming()),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Código Hamming"),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CajaDigito(
                      texto: "P1",
                      color: Color.fromARGB(255, 241, 178, 40),
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "P2",
                      color: Color.fromARGB(255, 241, 178, 40),
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "3",
                      color: Colors.grey,
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "P4",
                      color: Color.fromARGB(255, 241, 178, 40),
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "5",
                      color: Colors.grey,
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "6",
                      color: Colors.grey,
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                    _CajaDigito(
                      texto: "7",
                      color: Colors.grey,
                      mostrarLinea: false,
                      digito: Provider.of<Hamming>(context, listen: false).nulo,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CajaBinario(
                      digito: 1,
                    ),
                    _CajaBinario(
                      digito: 2,
                    ),
                    _CajaBinario(
                      digito: 3,
                    ),
                    _CajaBinario(
                      digito: 4,
                    ),
                    _CajaBinario(
                      digito: 5,
                    ),
                    _CajaBinario(
                      digito: 6,
                    ),
                    _CajaBinario(
                      digito: 7,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CajaDigito(
                      digito: 10,
                      color: const Color.fromARGB(255, 241, 178, 40),
                      colorLinea: Colors.pink,
                      posLinea: 'L',
                    ),
                    const _LineaCaja(color: Colors.pink),
                    _CajaDigito(
                      digito: 3,
                      color: Colors.pink,
                      colorLinea: Colors.pink,
                    ),
                    const _LineaCaja(color: Colors.pink),
                    _CajaDigito(
                      digito: 5,
                      color: Colors.pink,
                      colorLinea: Colors.pink,
                    ),
                    const _LineaCaja(color: Colors.pink),
                    _CajaDigito(
                      digito: 7,
                      color: Colors.pink,
                      colorLinea: Colors.pink,
                      posLinea: 'R',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size, width: size),
                    _CajaDigito(
                      digito: 20,
                      color: const Color.fromARGB(255, 241, 178, 40),
                      colorLinea: Colors.red,
                      posLinea: 'L',
                    ),
                    _CajaDigito(
                      digito: 3,
                      color: Colors.red,
                      colorLinea: Colors.red,
                    ),
                    const _LineaCaja(color: Colors.red),
                    const _LineaCaja(color: Colors.red),
                    _CajaDigito(
                      digito: 6,
                      color: Colors.red,
                      colorLinea: Colors.red,
                    ),
                    _CajaDigito(
                      digito: 7,
                      color: Colors.red,
                      colorLinea: Colors.red,
                      posLinea: 'R',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size, width: size),
                    SizedBox(height: size, width: size),
                    SizedBox(height: size, width: size),
                    _CajaDigito(
                      digito: 40,
                      color: const Color.fromARGB(255, 241, 178, 40),
                      colorLinea: Colors.blue,
                      posLinea: 'L',
                    ),
                    _CajaDigito(
                      digito: 5,
                      color: Colors.blue,
                      colorLinea: Colors.blue,
                    ),
                    _CajaDigito(
                      digito: 6,
                      color: Colors.blue,
                      colorLinea: Colors.blue,
                    ),
                    _CajaDigito(
                      digito: 7,
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
      },
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
    final size = MediaQuery.of(context).size.height / 6;

    print("tamaooooooooooooooooooo ${size}");

    return Container(
      height: size / 10,
      width: size,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

// ignore: must_be_immutable
class _CajaDigito extends StatelessWidget {
  final Color color;
  final Color colorLinea;
  int digito;
  final String texto;
  final String posLinea;
  final bool mostrarLinea;

  _CajaDigito({
    required this.color,
    required this.digito,
    this.colorLinea = Colors.grey,
    this.posLinea = 'C',
    this.mostrarLinea = true,
    this.texto = "",
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 6;

    double leftPos = 0;
    double rightPos = 0;
    if (posLinea == 'L') {
      leftPos = size / 3;
    }

    if (posLinea == 'R') {
      rightPos = size / 3;
    }

    return Stack(
      children: [
        SizedBox(
          height: size,
          width: size,
          //color: Colors.amber,
        ),
        mostrarLinea
            ? Padding(
                padding: EdgeInsets.fromLTRB(
                    leftPos, size / 2.2, rightPos, size / 2.2),
                child: Container(
                  color: colorLinea,
                  height: size / 10,
                  width: size - leftPos - rightPos,
                ),
              )
            : SizedBox(
                width: size,
                height: size,
              ),
        Padding(
          padding: EdgeInsets.all(size / 6),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            height: size / 1.5,
            width: size / 1.5,
            child: Center(
                child: Text(texto != ''
                    ? texto
                    : Provider.of<Hamming>(context, listen: true)
                        .obtener(digito)
                        .toString())),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _CajaBinario extends StatelessWidget {
  int digito;

  _CajaBinario({
    required this.digito,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 6;

    return GestureDetector(
      onTap: () {
        Provider.of<Hamming>(context, listen: false).cambiar(digito);

        //digito = digito == 0 ? 1 : 0;
        /*
        print("Imprimoooooo" +
            Provider.of<Hamming>(context, listen: false)
                .obtener(digito)
                .toString());*/
      },
      child: Stack(
        children: [
          SizedBox(
            height: size,
            width: size,
            //color: Colors.amber,
          ),
          SizedBox(
            width: size,
            height: size,
          ),
          Padding(
            padding: EdgeInsets.all(size / 6),
            child: Container(
              decoration: BoxDecoration(
                color: Provider.of<Hamming>(context, listen: false).fondoBit,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              height: size / 1.5,
              width: size / 1.5,
              child: Center(
                  child: Text(Provider.of<Hamming>(context, listen: true)
                      .obtener(digito)
                      .toString())),
            ),
          ),
        ],
      ),
    );
  }
}
