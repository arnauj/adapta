import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import 'package:adapta/providers/providers.dart';
import 'package:adapta/router/app_routes.dart';
import 'package:adapta/theme/app_theme.dart';
import 'package:adapta/widgets/widgets.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PainterProvider()),
      ],
      child: MaterialApp(
        title: 'ADAPTA',
        home: MyApp(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ScreenshotController screenshotController = ScreenshotController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatinActionButtonGeneralWidget(),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.getAppRoutes(),
            ),
            PainterWidget(screenshotController: screenshotController),
          ],
        ),
      ),
    );
  }
}
