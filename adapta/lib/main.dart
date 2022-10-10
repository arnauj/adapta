import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

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

final Uri _url =
    Uri.parse('https://adapta.cifpzonzamas.es/politicaPrivacidadDatos.html');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
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
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width / 2 - 100,
              child: const Center(
                child: ElevatedButton(
                  onPressed: _launchUrl,
                  child: Text('Política de Privacidad'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
