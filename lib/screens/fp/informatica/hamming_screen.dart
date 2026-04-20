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
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Provider.of<Hamming>(context, listen: false)
                        .cambiarParidad();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        size / 4, size / 8, size / 4, size / 8),
                    child: Text(
                      Provider.of<Hamming>(context, listen: true).paridadPar
                          ? "CAMBIAR A PARIDAD IMPAR"
                          : "CAMBIAR A PARIDAD PAR",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<Hamming>(context, listen: false)
                        .cambiarHamming74();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        size / 4, size / 8, size / 4, size / 8),
                    child: Text(
                      Provider.of<Hamming>(context, listen: true).hamming74
                          ? "CAMBIAR A HAMMING (15, 11) "
                          : "CAMBIAR A HAMMING (7, 4)",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
          body: Provider.of<Hamming>(context, listen: true).hamming74
              ? hamming74(context, size)
              : hamming1511(context, size),
        );
      },
    );
  }

  Column hamming74(BuildContext context, double size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
          mainAxisAlignment: MainAxisAlignment.start,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _CajaDigito(
              digito: 100,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size, width: size),
            _CajaDigito(
              digito: 200,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size, width: size),
            SizedBox(height: size, width: size),
            SizedBox(height: size, width: size),
            _CajaDigito(
              digito: 400,
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
    );
  }

  Column hamming1511(BuildContext context, double size) {
    double ancho = size / 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            _CajaDigito(
              texto: "P8",
              color: Color.fromARGB(255, 241, 178, 40),
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "9",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "10",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "11",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "12",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "13",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "14",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
            _CajaDigito(
              texto: "15",
              color: Colors.grey,
              mostrarLinea: false,
              digito: Provider.of<Hamming>(context, listen: false).nulo,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            _CajaBinario(
              digito: 8,
            ),
            _CajaBinario(
              digito: 9,
            ),
            _CajaBinario(
              digito: 10,
            ),
            _CajaBinario(
              digito: 11,
            ),
            _CajaBinario(
              digito: 12,
            ),
            _CajaBinario(
              digito: 13,
            ),
            _CajaBinario(
              digito: 14,
            ),
            _CajaBinario(
              digito: 15,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _CajaDigito(
              digito: 100,
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
            ),
            const _LineaCaja(color: Colors.pink),
            _CajaDigito(
              digito: 9,
              color: Colors.pink,
              colorLinea: Colors.pink,
            ),
            const _LineaCaja(color: Colors.pink),
            _CajaDigito(
              digito: 11,
              color: Colors.pink,
              colorLinea: Colors.pink,
            ),
            const _LineaCaja(color: Colors.pink),
            _CajaDigito(
              digito: 13,
              color: Colors.pink,
              colorLinea: Colors.pink,
            ),
            const _LineaCaja(color: Colors.pink),
            _CajaDigito(
              digito: 15,
              color: Colors.pink,
              colorLinea: Colors.pink,
              posLinea: 'R',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size / 2, width: size / 1.7),
            _CajaDigito(
              digito: 200,
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
            ),
            const _LineaCaja(color: Colors.red),
            const _LineaCaja(color: Colors.red),
            _CajaDigito(
              digito: 10,
              color: Colors.red,
              colorLinea: Colors.red,
            ),
            _CajaDigito(
              digito: 11,
              color: Colors.red,
              colorLinea: Colors.red,
            ),
            const _LineaCaja(color: Colors.red),
            const _LineaCaja(color: Colors.red),
            _CajaDigito(
              digito: 14,
              color: Colors.red,
              colorLinea: Colors.red,
            ),
            _CajaDigito(
              digito: 15,
              color: Colors.red,
              colorLinea: Colors.red,
              posLinea: 'R',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            _CajaDigito(
              digito: 400,
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
            ),
            const _LineaCaja(color: Colors.blue),
            const _LineaCaja(color: Colors.blue),
            const _LineaCaja(color: Colors.blue),
            const _LineaCaja(color: Colors.blue),
            _CajaDigito(
              digito: 12,
              color: Colors.blue,
              colorLinea: Colors.blue,
            ),
            _CajaDigito(
              digito: 13,
              color: Colors.blue,
              colorLinea: Colors.blue,
            ),
            _CajaDigito(
              digito: 14,
              color: Colors.blue,
              colorLinea: Colors.blue,
            ),
            _CajaDigito(
              digito: 15,
              color: Colors.blue,
              colorLinea: Colors.blue,
              posLinea: 'R',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            SizedBox(height: size / 2, width: size / 1.7),
            _CajaDigito(
              digito: 400,
              color: const Color.fromARGB(255, 241, 178, 40),
              colorLinea: Colors.lime,
              posLinea: 'L',
            ),
            _CajaDigito(
              digito: 9,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 10,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 11,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 12,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 13,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 14,
              color: Colors.lime,
              colorLinea: Colors.lime,
            ),
            _CajaDigito(
              digito: 15,
              color: Colors.lime,
              colorLinea: Colors.lime,
              posLinea: 'R',
            ),
          ],
        ),
      ],
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

    bool hamming74 = Provider.of<Hamming>(context, listen: true).hamming74;

    //print("tamaooooooooooooooooooo ${size}");

    return Container(
      height: size / 10,
      width: hamming74 ? size : size / 1.7,
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

    bool hamming74 = Provider.of<Hamming>(context, listen: true).hamming74;

    double divisor = 0;
    double altura = 0;
    double anchoLinea = 0;

    if (hamming74) {
      divisor = 1.5;
      altura = 2.2;
      anchoLinea = size;
    } else {
      divisor = 2;
      altura = 4;
      anchoLinea = size / 1.65;
    }

    return Stack(
      children: [
        mostrarLinea
            ? Padding(
                padding: EdgeInsets.fromLTRB(
                    leftPos, size / altura, rightPos, size / altura),
                child: Container(
                  color: colorLinea,
                  height: size / 10,
                  width: anchoLinea - leftPos - rightPos,
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
        Padding(
          padding:
              hamming74 ? EdgeInsets.all(size / 6) : EdgeInsets.all(size / 20),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            height: size / divisor,
            width: size / divisor,
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

    bool hamming74 = Provider.of<Hamming>(context, listen: true).hamming74;

    double divisor = hamming74 ? 1.5 : 2;
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
          Padding(
            padding: hamming74
                ? EdgeInsets.symmetric(horizontal: size / 6)
                : EdgeInsets.symmetric(horizontal: size / 20),
            child: Container(
              decoration: BoxDecoration(
                color: Provider.of<Hamming>(context, listen: false).fondoBit,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              height: size / divisor,
              width: size / divisor,
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
