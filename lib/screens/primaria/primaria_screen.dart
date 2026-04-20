import 'package:flutter/material.dart';

import 'package:adapta/screens/screens.dart';
import 'package:adapta/widgets/widgets.dart';

class PrimariaScreen extends StatelessWidget {
  const PrimariaScreen({Key? key}) : super(key: key);

  static const String route = 'primaria';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final materias = <Map<String, dynamic>>[
      {
        'nombre': 'Matemáticas',
        'icon': Icons.calculate_rounded,
        'ruta': MatematicasPrimariaScreen.route,
      },
      {
        'nombre': 'Conocimiento del Medio',
        'icon': Icons.people_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Educación Artística',
        'icon': Icons.palette_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Ed. en Valores Cívicos',
        'icon': Icons.emoji_people_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Educación Física',
        'icon': Icons.sports_gymnastics_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Lengua Castellana',
        'icon': Icons.menu_book_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Lengua Extranjera',
        'icon': Icons.flag_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Ed. Emocional y Creatividad',
        'icon': Icons.favorite_rounded,
        'ruta': null,
      },
      {
        'nombre': 'Segunda Lengua Extranjera',
        'icon': Icons.translate_rounded,
        'ruta': null,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Materias de Primaria'),
        backgroundColor: Colors.pink.shade600,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: size.width > size.height ? 5 : 4,
        children: [
          for (final item in materias)
            BoxIntroWidget(
              texto: item['nombre'] as String,
              icon: item['icon'] as IconData,
              color: item['ruta'] != null
                  ? Colors.pink.shade500
                  : Colors.pink.shade300,
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
                          'materias. Si quieres aportar alguna idea, envía un '
                          'email a adapta@programacionPrimaria.es'),
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
