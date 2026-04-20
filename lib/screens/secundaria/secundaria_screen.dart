import 'package:flutter/material.dart';

import 'package:adapta/widgets/widgets.dart';

class SecundariaScreen extends StatelessWidget {
  const SecundariaScreen({Key? key}) : super(key: key);

  static const String route = 'secundaria';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final Set<Map<String, dynamic>> familiasProfesionales = {
      {"nombre": "Lengua Castellana y Literatura", "icon": Icons.language},
      {"nombre": "Primera Lengua Extranjera Inglés", "icon": Icons.flag},
      {"nombre": "Geografía e Historia", "icon": Icons.history},
      {"nombre": "Matemáticas", "icon": Icons.calculate},
      {"nombre": "Biología y Geología", "icon": Icons.biotech_outlined},
      {"nombre": "Física y Química", "icon": Icons.hot_tub_rounded},
      {"nombre": "Educación Física", "icon": Icons.sports_gymnastics},
      {"nombre": "Religión / Valores Éticos", "icon": Icons.person},
      {"nombre": "Segunda Lengua Extranjera", "icon": Icons.flag_sharp},
      {
        "nombre": "Educación Plástica y Visual",
        "icon": Icons.view_stream_outlined
      },
      {"nombre": "Música", "icon": Icons.music_note},
      {"nombre": "Tecnología", "icon": Icons.electric_bolt},
      {
        "nombre": "Prácticas Comunicativas y Creativas",
        "icon": Icons.broadcast_on_personal
      },
      {
        "nombre": "Tecnologías de la Información y la Comunicación",
        "icon": Icons.computer
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Especialidades"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: GridView.count(
            primary: false,
            // physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: size.width > size.height ? 5 : 4,
            children: <Widget>[
              for (var item in familiasProfesionales)
                BoxIntroWidget(
                  texto: item['nombre'],
                  icon: item['icon'],
                  color: Colors.brown,
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('En desarrollo'),
                      content: const Text(
                          'Se irán añadiendo ejercicios de las diferentes especialidades. Si quieres enviar aportar alguna idea, envía un email a adapta@programacionSecundaria.es'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
            ]),
      ),
      //appBar: AppBar(title: Center(child: Text("ADAPTA"))),
    );
  }
}
