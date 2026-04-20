import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/providers/providers.dart';

class PrestacionDesempleoScreen extends StatefulWidget {
  PrestacionDesempleoScreen({super.key});

  static const String route = 'desempleo';

  int prestacionDias = 0;
  int prestacionMeses = 0;
  int prestacionAnhos = 0;

  // Crea una lista de booleanos inicializada en false
  List<bool> errorCamposBase = List<bool>.generate(10, (index) => false);

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
  final numHijosController = TextEditingController();

  String resultadoCalculoPrestacion = '';

  double baseReguladoraDiaria = 0;

  int diasPrestacion = 0;
  int dias180Menos = 0;
  int dias180Mas = 0;

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Días trabajados',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Text(
              diasPrestacion.toString(),
              style: const TextStyle(
                  fontSize: 48,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            diasPrestacion < 360
                ? const Text(
                    "El periodo mínimo de cotización deben ser 360 días en los últimos 6 años",
                    style: TextStyle(fontSize: 28))
                : restoCalculoBRD(size),
          ],
        ),
      ),
    );
  }

  Column restoCalculoBRD(Size size) {
    return Column(
      children: [
        const Text(
          'Bases Reguladoras',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 15,
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
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Base Reguladora Diaria',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                      '${base1Controller.text == '' ? 'Base 1' : base1Controller.text} + ${base2Controller.text == '' ? 'Base 2' : base2Controller.text} + ${base3Controller.text == '' ? 'Base 3' : base3Controller.text} + ${base4Controller.text == '' ? 'Base 4' : base4Controller.text} + ${base5Controller.text == '' ? 'Base 5' : base5Controller.text} + ${base6Controller.text == '' ? 'Base 6' : base6Controller.text}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 70, 0),
                  child: Text(
                    '180',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                ' = ${baseReguladoraDiaria.toStringAsFixed(2)} €/día',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Número de Hijos",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        _cajaBaseReguladora(size, "Número de hijos", 7),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(resultadoCalculoPrestacion,
                style: TextStyle(fontSize: 20)))
      ],
    );
  }

  SizedBox _cajaBaseReguladora(Size size, String texto, int base) {
    TextEditingController controlador;

    String textoBase = "Base reguladora $base";

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
      case 6:
        controlador = base6Controller;
        break;
      default:
        controlador = numHijosController;

        textoBase = "Número de hijos";

        break;
    }

    return SizedBox(
      width: size.width / 7,
      child: TextField(
        style: const TextStyle(fontSize: 18),
        controller: controlador,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          baseReguladoraDiaria = 0.0;

          if (double.tryParse(base1Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base1Controller.text);
          }
          if (double.tryParse(base2Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base2Controller.text);
          }
          if (double.tryParse(base3Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base3Controller.text);
          }
          if (double.tryParse(base4Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base4Controller.text);
          }
          if (double.tryParse(base5Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base5Controller.text);
          }
          if (double.tryParse(base6Controller.text) != null) {
            baseReguladoraDiaria += double.parse(base6Controller.text);
          }

          baseReguladoraDiaria = baseReguladoraDiaria / 180;

          print("baseReguladoraDiaria>" +
              base.toString() +
              '<' +
              baseReguladoraDiaria.toString());

          //baseReguladoraDiaria++;

          if (double.tryParse(base6Controller.text) != null &&
              double.tryParse(base5Controller.text) != null &&
              double.tryParse(base4Controller.text) != null &&
              double.tryParse(base3Controller.text) != null &&
              double.tryParse(base2Controller.text) != null &&
              double.tryParse(base1Controller.text) != null &&
              double.tryParse(numHijosController.text) != null) {
            double prestacionFinalMenos180 = 0;
            double prestacionFinalMas180 = 0;

            if (dias180Menos > 0) {
              prestacionFinalMenos180 = 30 * 0.7 * baseReguladoraDiaria;
            }

            if (dias180Mas > 0) {
              prestacionFinalMas180 = 30 * 0.4 * baseReguladoraDiaria;
            }

            //Fijar cantidades mínimas
            bool modificadoLimiteMaximo = false;
            bool modificadoLimiteMinimo = false;
            if (double.tryParse(numHijosController.text) == 0) {
              if (prestacionFinalMas180 < 540.41) {
                prestacionFinalMas180 = 540.41;
                modificadoLimiteMinimo = true;
              }
              if (prestacionFinalMenos180 < 540.41) {
                prestacionFinalMenos180 = 540.41;
                modificadoLimiteMinimo = true;
              }
              if (prestacionFinalMas180 > 1182.16) {
                prestacionFinalMas180 = 1182.16;
                modificadoLimiteMaximo = true;
              }
              if (prestacionFinalMenos180 > 1182.16) {
                prestacionFinalMenos180 = 1182.16;
                modificadoLimiteMaximo = true;
              }
            }
            if (double.tryParse(numHijosController.text) == 1) {
              if (prestacionFinalMas180 > 1351.04) {
                prestacionFinalMas180 = 1351.04;
                modificadoLimiteMaximo = true;
              }
              if (prestacionFinalMenos180 > 1351.04) {
                prestacionFinalMenos180 = 1351.04;
                modificadoLimiteMaximo = true;
              }
            }

            if (double.tryParse(numHijosController.text)! >= 1) {
              if (prestacionFinalMas180 < 722.80) {
                prestacionFinalMas180 = 722.80;
                modificadoLimiteMinimo = true;
              }
              if (prestacionFinalMenos180 < 722.80) {
                prestacionFinalMenos180 = 722.80;
                modificadoLimiteMinimo = true;
              }
            }
            if (double.tryParse(numHijosController.text)! > 1) {
              if (prestacionFinalMas180 > 1519.92) {
                prestacionFinalMas180 = 1519.92;
                modificadoLimiteMaximo = true;
              }
              if (prestacionFinalMenos180 > 1519.92) {
                prestacionFinalMenos180 = 1519.92;
                modificadoLimiteMaximo = true;
              }
            }

            if (modificadoLimiteMinimo || modificadoLimiteMaximo) {
              Widget okButton = TextButton(
                child: Text("ENTENDIDO"),
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop('dialog'),
              );

              String textoModificacionLimite = '';
              if (modificadoLimiteMinimo) {
                textoModificacionLimite = "Se ha modificado el tope mínimo.";
              }
              if (modificadoLimiteMaximo) {
                textoModificacionLimite = "Se ha modificado el tope máximo.";
              }
              AlertDialog alert = AlertDialog(
                title: const Text("Se han modificado los topes"),
                content: Text(textoModificacionLimite),
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
            //Euros dias
            //contingencias comunes se restan después de aplicar los límites
            //Ventana emergente cuando se aplica un límite

            double contingenciasComunes = baseReguladoraDiaria * 0.047 * 30;

            double netoFinalMenos180 =
                prestacionFinalMenos180 - contingenciasComunes;
            double netoFinalMas180 =
                prestacionFinalMas180 - contingenciasComunes;

            double duracionPrestacion = 0;
            if (diasPrestacion >= 360 && diasPrestacion <= 539) {
              duracionPrestacion = 120;
            } else if (diasPrestacion >= 540 && diasPrestacion <= 719) {
              duracionPrestacion = 180;
            } else if (diasPrestacion >= 720 && diasPrestacion <= 899) {
              duracionPrestacion = 240;
            } else if (diasPrestacion >= 900 && diasPrestacion <= 1079) {
              duracionPrestacion = 300;
            } else if (diasPrestacion >= 1080 && diasPrestacion <= 1259) {
              duracionPrestacion = 360;
            } else if (diasPrestacion >= 1260 && diasPrestacion <= 1439) {
              duracionPrestacion = 420;
            } else if (diasPrestacion >= 1440 && diasPrestacion <= 1619) {
              duracionPrestacion = 480;
            } else if (diasPrestacion >= 1620 && diasPrestacion <= 1799) {
              duracionPrestacion = 540;
            } else if (diasPrestacion >= 1800 && diasPrestacion <= 1979) {
              duracionPrestacion = 600;
            } else if (diasPrestacion >= 1980 && diasPrestacion <= 2159) {
              duracionPrestacion = 660;
            } else if (diasPrestacion >= 2160) {
              duracionPrestacion = 720;
            }

            resultadoCalculoPrestacion = """
              Prestación -180 días: ${prestacionFinalMenos180.toStringAsFixed(2)}€
              Prestación +180 días: ${prestacionFinalMas180.toStringAsFixed(2)}€
              Contingencias Comunes: ${contingenciasComunes.toStringAsFixed(2)}€
              Neto -180 días: ${netoFinalMenos180.toStringAsFixed(2)}€
              Neto +180 días: ${netoFinalMas180.toStringAsFixed(2)}€
              Días total Prestación: ${duracionPrestacion.round()} días
            """;
          }

          setState(() {
            widget.errorCamposBase[base] = double.tryParse(value) == null;
          });
        },
        decoration: InputDecoration(
          border: widget.errorCamposBase[base]
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                )
              : const OutlineInputBorder(),
          labelText: texto,
          prefixIcon: Icon(base <= 6 ? Icons.badge_sharp : Icons.child_care),
          hintText: textoBase,
          errorText: widget.errorCamposBase[base] ? 'Debe ser numérico' : null,
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

    for (int anho = 0; anho <= 12; anho++) {
      opcionesAnhos.add(anho);
    }

    for (int anho = 0; anho <= 31; anho++) {
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
            _desplegable(
              "Años",
              opcionesAnhos,
              'anho',
              size,
            ),
            _desplegable(
              "Meses",
              opcionesAnhos,
              'mes',
              size,
            ),
            _desplegable(
              "Días",
              opcionesDias,
              'dia',
              size,
            ),
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
            diasPrestacion = widget.prestacionDias +
                widget.prestacionMeses * 30 +
                widget.prestacionAnhos * 365;

            print("Días prestacion" + diasPrestacion.toString());

            if (diasPrestacion <= 180) {
              dias180Menos = diasPrestacion;
            } else {
              dias180Menos = 180;
              dias180Mas = diasPrestacion - 180;
            }
          },
          child: const Text("Continuar", textAlign: TextAlign.center),
        )
      ],
    );
  }

  Column _desplegable(
    String texto,
    List<int> opcionesAnhos,
    String anhoMesDia,
    Size size,
  ) {
    int elementoInput = 0;

    switch (anhoMesDia) {
      case 'anho':
        elementoInput = widget.prestacionAnhos;
        break;
      case 'mes':
        elementoInput = widget.prestacionMeses;
        break;
      case 'dia':
        elementoInput = widget.prestacionDias;
        break;
    }

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
            value: elementoInput,
            onChanged: (int? newValue) {
              setState(() {
                elementoInput = newValue!;

                switch (anhoMesDia) {
                  case 'anho':
                    widget.prestacionAnhos = newValue!;
                    break;
                  case 'mes':
                    widget.prestacionMeses = newValue!;
                    break;
                  case 'dia':
                    widget.prestacionDias = newValue!;
                    break;
                }
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
