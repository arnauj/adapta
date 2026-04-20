import 'package:flutter/material.dart';

import 'package:adapta/screens/screens.dart';
import 'package:adapta/widgets/widgets.dart';

class SecundariaScreen extends StatelessWidget {
  const SecundariaScreen({Key? key}) : super(key: key);

  static const String route = 'secundaria';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final asignaturas = <Map<String, dynamic>>[
      {
        'nombre': 'Física y Química',
        'icon': Icons.science_rounded,
        'ruta': FisicaQuimicaScreen.route,
      },
      {
        'nombre': 'Matemáticas',
        'icon': Icons.calculate_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Lengua Castellana y Literatura',
        'icon': Icons.menu_book_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Inglés',
        'icon': Icons.flag_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Geografía e Historia',
        'icon': Icons.history_edu_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Biología y Geología',
        'icon': Icons.biotech_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Educación Física',
        'icon': Icons.sports_gymnastics_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Religión / Valores Éticos',
        'icon': Icons.person_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Segunda Lengua Extranjera',
        'icon': Icons.translate_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Educación Plástica y Visual',
        'icon': Icons.brush_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Música',
        'icon': Icons.music_note_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Tecnología',
        'icon': Icons.electric_bolt_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Prácticas Comunicativas',
        'icon': Icons.record_voice_over_rounded,
        'ruta': null,
      },
      {
        'nombre': 'TIC',
        'icon': Icons.computer_rounded,
        'ruta': null,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignaturas de Secundaria'),
        backgroundColor: Colors.brown.shade600,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: size.width > size.height ? 5 : 4,
        children: [
          for (final item in asignaturas)
            BoxIntroWidget(
              texto: item['nombre'] as String,
              icon: item['icon'] as IconData,
              color: item['ruta'] != null
                  ? Colors.brown.shade500
                  : Colors.brown.shade400,
              onTap: () {
                final ruta = item['ruta'] as String?;
                if (ruta != null) {
                  Navigator.pushNamed(context, ruta);
                } else {
                  showDialog<void>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('En desarrollo'),
                      content: const Text(
                          'Se irán añadiendo ejercicios de las diferentes '
                          'especialidades. Si quieres aportar alguna idea, '
                          'envía un email a adapta@programacionSecundaria.es'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
