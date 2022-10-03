import 'package:flutter/material.dart';
import 'package:adapta/widgets/widgets.dart';

import 'package:adapta/screens/screens.dart';

class FpScreen extends StatelessWidget {
  const FpScreen({Key? key}) : super(key: key);

  static const String route = 'fp';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final Set<Map<String, dynamic>> familiasProfesionales = {
      {
        "nombre": "Actividades Físicas y Deportivas",
        "icon": Icons.sports_gymnastics,
        "siguiente": false
      },
      {
        "nombre": "Administración y Gestión",
        "icon": Icons.admin_panel_settings,
        "siguiente": false
      },
      {
        "nombre": "Agraria",
        "icon": Icons.agriculture_sharp,
        "siguiente": false
      },
      {
        "nombre": "Artes Gráficas",
        "icon": Icons.graphic_eq,
        "siguiente": false
      },
      {
        "nombre": "Artes y Artesanías",
        "icon": Icons.handshake,
        "siguiente": false
      },
      {
        "nombre": "Comercio y Marketing",
        "icon": Icons.speaker_notes,
        "siguiente": false
      },
      {
        "nombre": "Edificación y obra civil",
        "icon": Icons.admin_panel_settings,
        "siguiente": false
      },
      {"nombre": "Electricidad y Electrónica", "icon": Icons.electric_bolt},
      {
        "nombre": "Energía y Agua",
        "icon": Icons.energy_savings_leaf,
        "siguiente": false
      },
      {
        "nombre": "Fabricación y Mecánica",
        "icon": Icons.precision_manufacturing_outlined,
        "siguiente": false
      },
      {
        "nombre": "Hostelería y Turismo",
        "icon": Icons.hotel,
        "siguiente": false
      },
      {
        "nombre": "Imagen Personal",
        "icon": Icons.hail_sharp,
        "siguiente": false
      },
      {"nombre": "Imagen y Sonido", "icon": Icons.speaker, "siguiente": false},
      {
        "nombre": "Industrias Alimentarias",
        "icon": Icons.food_bank,
        "siguiente": false
      },
      {
        "nombre": "Industrias Extractivas",
        "icon": Icons.exit_to_app_rounded,
        "siguiente": false
      },
      {
        "nombre": "Informática y Comunicaciones",
        "icon": Icons.computer,
        "siguiente": true,
        "ruta": InformaticaScreen.route
      },
      {
        "nombre": "Instalación y Mantenimiento",
        "icon": Icons.install_desktop,
        "siguiente": false
      },
      {
        "nombre": "Madera, mueble y corcho",
        "icon": Icons.chair,
        "siguiente": false
      },
      {"nombre": "Marítima-Pesquera", "icon": Icons.water, "siguiente": false},
      {"nombre": "Química", "icon": Icons.hot_tub_rounded, "siguiente": false},
      {
        "nombre": "Sanidad",
        "icon": Icons.health_and_safety,
        "siguiente": false
      },
      {
        "nombre": "Seguridad y Medio Ambiente",
        "icon": Icons.safety_check,
        "siguiente": false
      },
      {
        "nombre": "Servicios Socioculturales y a la Comunidad",
        "icon": Icons.social_distance,
        "siguiente": false
      },
      {
        "nombre": "Textil, Confección y Piel",
        "icon": Icons.boy_rounded,
        "siguiente": false
      },
      {
        "nombre": "Transporte y Mantenimiento de Vehículos",
        "icon": Icons.car_crash,
        "siguiente": false
      },
      {
        "nombre": "Vidrio y Cerámica",
        "icon": Icons.air_sharp,
        "siguiente": false
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Familias Profesionales"),
        backgroundColor: Colors.green,
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
                  color: Colors.green,
                  onTap: () {
                    if (item['siguiente']) {
                      Navigator.pushNamed(
                        context,
                        item['ruta'],
                      );
                    } else {
                      return showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('En desarrollo'),
                          content: const Text(
                              'Se irán añadiendo ejercicios de las diferentes especialidades. Si quieres enviar aportar alguna idea, envía un email a adapta@programacionfp.es'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
            ]),
      ),
    );
  }
}
