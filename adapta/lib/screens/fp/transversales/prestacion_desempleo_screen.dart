import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/providers/providers.dart';

class PrestacionDesempleoScreen extends StatefulWidget {
  PrestacionDesempleoScreen({super.key});

  static const String route = 'desempleo';

  int prestacionDias = 0;
  int prestacionMeses = 0;
  int prestacionAnhos = 0;

  @override
  State<PrestacionDesempleoScreen> createState() =>
      _PrestacionDesempleoScreenState();
}

class _PrestacionDesempleoScreenState extends State<PrestacionDesempleoScreen> {
  int paso = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget destino;

    switch (paso) {
      case 3:
        destino = _pasoTres(size);
        break;
      case 2:
        destino = _pasoDos(size);
        break;
      default:
        destino = _pasoUno(size);
        break;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Hamming()),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Prestación por desempleo"),
            backgroundColor: Colors.green,
          ),
          body: Center(child: destino),
        );
      },
    );
  }

  Text _pasoTres(Size size) {
    return const Text("Paso 3");
  }

  Column _pasoUno(Size size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 15, vertical: size.height / 25),
          child: const Text(
            '¿Se encuentra en situación legal de desempleo?',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cajaBoton("Se ha extinguido la relación laboral", size, false),
                const SizedBox(height: 10),
                _cajaBoton("Se ha suspendido la relación laboral", size, false),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cajaBoton("Se ha reducido temporalmente la jornada de trabajo",
                    size, false),
                const SizedBox(height: 10),
                _cajaBoton("Baja voluntaria", size, true),
              ],
            )
          ],
        )
      ],
    );
  }

  Column _pasoDos(Size size) {
    List<int> opcionesAnhos = [];
    List<int> opcionesDias = [];

    for (int anho = 0; anho < 12; anho++) {
      opcionesAnhos.add(anho);
    }

    for (int anho = 0; anho < 265; anho++) {
      opcionesDias.add(anho);
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 15, vertical: size.height / 25),
          child: const Text(
            '¿Cuál sería la duración de la prestación?',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _desplegable("Años", opcionesAnhos, size),
            _desplegable("Meses", opcionesAnhos, size),
            _desplegable("Días", opcionesDias, size),
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
            fixedSize: Size(size.width / 2 - 20, size.height / 6),
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 24),
          ),
          onPressed: () {
            paso = 3;
            setState(() {});
          },
          child: const Text("Continuar", textAlign: TextAlign.center),
        )
      ],
    );
  }

  Column _desplegable(String texto, List<int> opcionesAnhos, Size size) {
    return Column(
      children: [
        Text(texto, style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 10),
        SizedBox(
          width: size.width / 3 - 10,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              filled: true,
              fillColor: Colors.greenAccent,
            ),
            dropdownColor: Colors.greenAccent,
            value: widget.prestacionAnhos,
            onChanged: (int? newValue) {
              setState(() {
                widget.prestacionAnhos = newValue!;
              });
            },
            items: opcionesAnhos.map((e) {
              return DropdownMenuItem(
                  value: e, child: Center(child: Text(e.toString())));
            }).toList(),
          ),
        ),
      ],
    );
  }

  TextButton _cajaBoton(String texto, Size size, bool? fracaso) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(size.width / 2 - 20, size.height / 4),
        backgroundColor: const Color.fromARGB(255, 89, 128, 255),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 24),
      ),
      onPressed: () {
        if (fracaso == false) {
          paso = 2;
        } else {
          Widget okButton = TextButton(
            child: Text("ENTENDIDO"),
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop('dialog'),
          );

          AlertDialog alert = AlertDialog(
            title: const Text("No tienes derecho a prestación"),
            content: const Text(
                "Si finalizas el contrato laboral de forma voluntaria, no tienes derecho a prestación por desempleo."),
            actions: [
              okButton,
            ],
          );

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }

        setState(() {});
      },
      child: Text(texto, textAlign: TextAlign.center),
    );
  }
}
