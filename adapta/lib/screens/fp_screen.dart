import 'package:flutter/material.dart';

import 'package:adapta/widgets/widgets.dart';

class FpScreen extends StatelessWidget {
  const FpScreen({Key? key}) : super(key: key);

  static const String route = 'fp';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final Set<Map<String, dynamic>> familiasProfesionales = {
      {
        "nombre": "Actividades Físicas y Deportivas",
        "icon": Icons.sports_gymnastics
      },
      {
        "nombre": "Administración y Gestión",
        "icon": Icons.admin_panel_settings
      },
      {"nombre": "Agraria", "icon": Icons.agriculture_sharp},
      {"nombre": "Artes Gráficas", "icon": Icons.graphic_eq},
      {"nombre": "Artes y Artesanías", "icon": Icons.handshake},
      {"nombre": "Comercio y Marketing", "icon": Icons.speaker_notes},
      {
        "nombre": "Edificación y obra civil",
        "icon": Icons.admin_panel_settings
      },
      {"nombre": "Electricidad y Electrónica", "icon": Icons.electric_bolt},
      {"nombre": "Energía y Agua", "icon": Icons.energy_savings_leaf},
      {
        "nombre": "Fabricación y Mecánica",
        "icon": Icons.precision_manufacturing_outlined
      },
      {"nombre": "Hostelería y Turismo", "icon": Icons.hotel},
      {"nombre": "Imagen Personal", "icon": Icons.hail_sharp},
      {"nombre": "Imagen y Sonido", "icon": Icons.speaker},
      {"nombre": "Industrias Alimentarias", "icon": Icons.food_bank},
      {"nombre": "Industrias Extractivas", "icon": Icons.exit_to_app_rounded},
      {"nombre": "Informática y Comunicaciones", "icon": Icons.computer},
      {"nombre": "Instalación y Mantenimiento", "icon": Icons.install_desktop},
      {"nombre": "Madera, mueble y corcho", "icon": Icons.chair},
      {"nombre": "Marítima-Pesquera", "icon": Icons.water},
      {"nombre": "Química", "icon": Icons.hot_tub_rounded},
      {"nombre": "Sanidad", "icon": Icons.health_and_safety},
      {"nombre": "Seguridad y Medio Ambiente", "icon": Icons.safety_check},
      {
        "nombre": "Servicios Socioculturales y a la Comunidad",
        "icon": Icons.social_distance
      },
      {"nombre": "Textil, Confección y Piel", "icon": Icons.boy_rounded},
      {
        "nombre": "Transporte y Mantenimiento de Vehículos",
        "icon": Icons.car_crash
      },
      {"nombre": "Vidrio y Cerámica", "icon": Icons.air_sharp},
    };

    return SafeArea(
      child: Scaffold(
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
                    onTap: () => showDialog<String>(
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
                    ),
                  ),
              ]),
        ),
        //appBar: AppBar(title: Center(child: Text("ADAPTA"))),
      ),
    );
  }
}
