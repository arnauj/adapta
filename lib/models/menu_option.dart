import 'package:flutter/material.dart';

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  static final floatinActionButtonkey = GlobalKey();

  static double widthFloatinActionButton(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return size.width > size.height ? size.width / 18 : size.height / 18;
  }

  MenuOption({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
  });
}
