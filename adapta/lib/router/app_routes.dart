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
      route: InformaticaScreen.route,
      name: 'Informática y Comunicacioines',
      screen: InformaticaScreen(),
      icon: Icons.computer,
    ),
    MenuOption(
      route: HammingScreen.route,
      name: 'Código Hamming',
      screen: const HammingScreen(),
      icon: Icons.computer,
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

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home'     : ( BuildContext context ) => const HomeScreen(),
  //   'listview1': ( BuildContext context ) => const Listview1Screen(),
  //   'listview2': ( BuildContext context ) => const Listview2Screen(),
  //   'alert'    : ( BuildContext context ) => const AlertScreen(),
  //   'card'     : ( BuildContext context ) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
