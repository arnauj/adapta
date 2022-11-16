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

  final base1Controller = TextEditingController();
  final base2Controller = TextEditingController();
  final base3Controller = TextEditingController();
  final base4Controller = TextEditingController();
  final base5Controller = TextEditingController();
  final base6Controller = TextEditingController();

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

  Center _pasoTres(Size size) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Bases Reguladoras',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _cajaBaseReguladora(size, "Base 1", 1),
              _cajaBaseReguladora(size, "Base 2", 2),
              _cajaBaseReguladora(size, "Base 3", 3),
              _cajaBaseReguladora(size, "Base 4", 4),
              _cajaBaseReguladora(size, "Base 5", 5),
              _cajaBaseReguladora(size, "Base 6", 6),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Bases Reguladora Diaria',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'BRD = ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Text(
                        (base1Controller.text == ''
                                ? 'Base 1'
                                : base1Controller.text) +
                            ' + ' +
                            (base2Controller.text == ''
                                ? 'Base 2'
                                : base2Controller.text) +
                            ' + ' +
                            (base3Controller.text == ''
                                ? 'Base 3'
                                : base3Controller.text) +
                            ' + ' +
                            (base4Controller.text == ''
                                ? 'Base 4'
                                : base4Controller.text) +
                            ' + ' +
                            (base5Controller.text == ''
                                ? 'Base 5'
                                : base5Controller.text) +
                            ' + ' +
                            (base6Controller.text == ''
                                ? 'Base 6'
                                : base6Controller.text),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '180',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  SizedBox _cajaBaseReguladora(Size size, String texto, int base) {
    TextEditingController controlador;
    switch (base) {
      case 1:
        controlador = base1Controller;
        break;
      case 2:
        controlador = base2Controller;
        break;
      case 3:
        controlador = base3Controller;
        break;
      case 4:
        controlador = base4Controller;
        break;
      case 5:
        controlador = base5Controller;
        break;
      default:
        controlador = base6Controller;
        break;
    }

    return SizedBox(
      width: size.width / 7,
      child: TextField(
        style: const TextStyle(fontSize: 18),
        controller: controlador,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          print(">>>>>>>>>>>>>" + value);
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: texto,
          prefixIcon: const Icon(Icons.badge_sharp),
          hintText: "Base reguladora $base",
        ),
      ),
    );
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
