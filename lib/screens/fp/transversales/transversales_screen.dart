import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:adapta/screens/screens.dart';

class TransversalesScreen extends StatelessWidget {
  TransversalesScreen({super.key});

  static const String route = 'transversales';

  final List<Map<String, dynamic>> ejercicios = [
    {
      'titulo': 'Prestación por Desempleo',
      'ruta': PrestacionDesempleoScreen.route,
      'img': 'assets/img/transversales/desempleo.png',
      'color': Colors.green,
    },
    {
      'titulo': 'Calculadora de Nómina',
      'ruta': NominaScreen.route,
      'img': '',
      'color': const Color(0xFF2E7D32),
    },
    {
      'titulo': 'Ejercicio 3',
      'ruta': PrestacionDesempleoScreen.route,
      'img': '',
      'color': const Color(0xFF388E3C),
    },
    {
      'titulo': 'Ejercicio 4',
      'ruta': PrestacionDesempleoScreen.route,
      'img': '',
      'color': const Color(0xFF43A047),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulos Transversales'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _tarjeta(
            context: context,
            route: ejercicios[index]['ruta'] as String,
            titulo: ejercicios[index]['titulo'] as String,
            img: ejercicios[index]['img'] as String,
            color: ejercicios[index]['color'] as Color,
          );
        },
        itemCount: ejercicios.length,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        layout: SwiperLayout.STACK,
      ),
    );
  }

  GestureDetector _tarjeta({
    required BuildContext context,
    required String route,
    required String titulo,
    required String img,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              color,
              Color.lerp(color, Colors.white, 0.3)!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: img.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(img),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.touch_app_rounded,
                        color: Colors.white70, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
