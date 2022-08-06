import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/models/models.dart';
import 'package:adapta/widgets/widgets.dart';
import 'package:adapta/providers/providers.dart';
import 'package:adapta/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ADAPTA"),
      ),
      //appBar: AppBar(title: Center(child: Text("ADAPTA"))),
      floatingActionButton: FloatinActionButtonGeneralWidget(),
    );
  }
}
