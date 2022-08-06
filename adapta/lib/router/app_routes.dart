import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import 'package:adapta/models/models.dart';
import 'package:adapta/providers/providers.dart';
import 'package:adapta/screens/screens.dart';
import 'package:adapta/widgets/widgets.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.route;

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: AlertScreen.route,
        name: 'Alertas - Alerts',
        screen: const AlertScreen(),
        icon: Icons.add_alert_outlined),
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
    ScreenshotController screenshotController = ScreenshotController();

    return Screenshot(
      controller: screenshotController,
      child: SafeArea(
        child: Stack(
          children: [
            firstWidget,
            PainterWidget(screenshotController: screenshotController),
          ],
        ),
      ),
    );
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
