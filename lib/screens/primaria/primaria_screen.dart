import 'package:flutter/material.dart';

import 'package:adapta/widgets/widgets.dart';

class PrimariaScreen extends StatelessWidget {
  const PrimariaScreen({Key? key}) : super(key: key);

  static const String route = 'primaria';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final Set<Map<String, dynamic>> familiasProfesionales = {
      {
        "nombre": "Conocimiento del Medio Natural, Social y Cultural",
        "icon": Icons.people
      },
      {"nombre": "Educación Artística", "icon": Icons.soup_kitchen},
      {
        "nombre": "Educación en Valores Cívicos y Éticos",
        "icon": Icons.emoji_people
      },
      {"nombre": "Educación Física", "icon": Icons.sports_gymnastics},
      {"nombre": "Lengua Castellana y Literatura", "icon": Icons.language},
      {"nombre": "Lengua Extranjera", "icon": Icons.flag},
      {"nombre": "Matemáticas", "icon": Icons.calculate},
      {
        "nombre": "Educación Emocional y para la Creatividad",
        "icon": Icons.dry
      },
      {"nombre": "Segunda Lengua Extranjera", "icon": Icons.flag},
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Materias"),
        backgroundColor: Colors.pink,
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
                  color: Colors.pink,
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('En desarrollo'),
                      content: const Text(
                          'Se irán añadiendo ejercicios de las diferentes especialidades. Si quieres enviar aportar alguna idea, envía un email a adapta@programacionPrimaria.es'),
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
