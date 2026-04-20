import 'package:flutter/material.dart';

import 'package:adapta/models/models.dart';
import 'package:adapta/screens/screens.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.route;

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: AlertScreen.route,
      name: 'Alertas - Alerts',
      screen: const AlertScreen(),
      icon: Icons.add_alert_outlined,
    ),
    MenuOption(
      route: OpenPdf.route,
      name: 'Carga PDF',
      screen: const OpenPdf(),
      icon: Icons.picture_as_pdf,
    ),
    MenuOption(
      route: DisplayImage.route,
      icon: Icons.image,
      name: 'Imagen',
      screen: const DisplayImage(),
    ),
    MenuOption(
      route: OfficeFormat.route,
      name: 'Excel, PPT, DOC..',
      screen: const OfficeFormat(),
      icon: Icons.file_copy,
    ),
    MenuOption(
      route: FpScreen.route,
      name: 'Especialidades FP',
      screen: const FpScreen(),
      icon: Icons.work_sharp,
    ),
    MenuOption(
      route: SecundariaScreen.route,
      name: 'Secundaria',
      screen: const SecundariaScreen(),
      icon: Icons.school,
    ),
    MenuOption(
      route: PrimariaScreen.route,
      name: 'Primaria',
      screen: const PrimariaScreen(),
      icon: Icons.child_care,
    ),
    MenuOption(
      route: MatematicasPrimariaScreen.route,
      name: 'Matemáticas Primaria',
      screen: const MatematicasPrimariaScreen(),
      icon: Icons.calculate,
    ),
    MenuOption(
      route: FisicaQuimicaScreen.route,
      name: 'Física y Química',
      screen: const FisicaQuimicaScreen(),
      icon: Icons.science,
    ),
    MenuOption(
      route: InformaticaScreen.route,
      name: 'Informática y Comunicaciones',
      screen: InformaticaScreen(),
      icon: Icons.computer,
    ),
    MenuOption(
      route: HammingScreen.route,
      name: 'Código Hamming',
      screen: const HammingScreen(),
      icon: Icons.computer,
    ),
    MenuOption(
      route: TransversalesScreen.route,
      name: 'Módulos Transversales',
      screen: TransversalesScreen(),
      icon: Icons.manage_history,
    ),
    MenuOption(
      route: PrestacionDesempleoScreen.route,
      name: 'Prestación por desempleo',
      screen: PrestacionDesempleoScreen(),
      icon: Icons.work_history,
    ),
    MenuOption(
      route: NominaScreen.route,
      name: 'Calculadora de Nómina',
      screen: const NominaScreen(),
      icon: Icons.receipt_long,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      HomeScreen.route: (BuildContext context) {
        return _loadFirstScreen(const HomeScreen());
      }
    });

    for (final option in menuOptions) {
      appRoutes.addAll({
        option.route: (BuildContext context) {
          return _loadFirstScreen(option.screen);
        }
      });
    }

    return appRoutes;
  }

  static Widget _loadFirstScreen(Widget firstWidget) {
    return firstWidget;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
