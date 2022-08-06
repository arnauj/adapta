import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adapta/providers/providers.dart';
import 'package:adapta/router/app_routes.dart';
import 'package:adapta/theme/app_theme.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PainterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADAPTA',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      theme: AppTheme.lightTheme,
    );
  }
}
