import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adapta/screens/screens.dart';
import 'package:adapta/widgets/widgets.dart';
import 'package:adapta/theme/app_theme.dart';

final Uri _url =
    Uri.parse('http://adapta.cifpzonzamas.es/politicaPrivacidadDatos.html');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isLandscape = size.width > size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.only(left: 20, bottom: 14),
                title: const Text(
                  'ADAPTA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryDark,
                        AppTheme.primary,
                        AppTheme.primaryLight,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Paneles Táctiles Activos',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate([
                  BoxIntroWidget(
                    texto: 'PDF',
                    icon: Icons.picture_as_pdf_rounded,
                    color: const Color(0xFFE53935),
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          OpenPdf.route,
                          arguments: result.files.single.path.toString(),
                        );
                      }
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'Imágenes',
                    icon: Icons.photo_library_rounded,
                    color: const Color(0xFF1E88E5),
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'gif', 'png'],
                      );
                      if (result != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          DisplayImage.route,
                          arguments: result.files.single.path.toString(),
                        );
                      }
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'FP',
                    icon: Icons.work_rounded,
                    color: const Color(0xFF43A047),
                    onTap: () => Navigator.pushNamed(context, FpScreen.route),
                  ),
                  BoxIntroWidget(
                    texto: 'Secundaria',
                    icon: Icons.school_rounded,
                    color: const Color(0xFF6D4C41),
                    onTap: () =>
                        Navigator.pushNamed(context, SecundariaScreen.route),
                  ),
                  BoxIntroWidget(
                    texto: 'Primaria',
                    icon: Icons.child_care_rounded,
                    color: const Color(0xFFE91E8C),
                    onTap: () =>
                        Navigator.pushNamed(context, PrimariaScreen.route),
                  ),
                ]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 5 : 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: isLandscape ? 1.05 : 0.95,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Center(
            child: TextButton.icon(
              onPressed: _launchUrl,
              icon: const Icon(Icons.privacy_tip_outlined, size: 18),
              label: const Text('Política de Privacidad'),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
