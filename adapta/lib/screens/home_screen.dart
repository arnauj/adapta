import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adapta/screens/screens.dart';
import 'package:adapta/widgets/widgets.dart';

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

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: GridView.count(
                primary: false,
                // physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),

                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: size.width > size.height ? 5 : 4,
                children: <Widget>[
                  BoxIntroWidget(
                    texto: 'PDF',
                    icon: Icons.picture_as_pdf,
                    color: Colors.red,
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        //File file = File();

                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          OpenPdf.route,
                          arguments: result.files.single.path.toString(),
                        );
                      } else {
                        // User canceled the picker
                      }

                      //
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'Imágenes',
                    icon: Icons.photo_library,
                    color: Colors.blue,
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'gif', 'png'],
                      );

                      if (result != null) {
                        //File file = File();

                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          DisplayImage.route,
                          arguments: result.files.single.path.toString(),
                        );
                      } else {
                        // User canceled the picker
                      }

                      //
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'FP',
                    icon: Icons.work_sharp,
                    color: Colors.green,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        FpScreen.route,
                        //arguments: result.files.single.path.toString(),
                      );
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'Secundaria',
                    icon: Icons.school,
                    color: Colors.brown,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SecundariaScreen.route,
                        //arguments: result.files.single.path.toString(),
                      );
                    },
                  ),
                  BoxIntroWidget(
                    texto: 'Primaria',
                    icon: Icons.child_care,
                    color: Colors.pink,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PrimariaScreen.route,
                        //arguments: result.files.single.path.toString(),
                      );
                    },
                  ),
                  /*
                BoxIntroWidget(
                  texto: 'Excel, PPT, DOC..',
                  icon: Icons.file_copy,
                  color: Colors.green,
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: [
                        'pdf',
                        'docx',
                        'doc',
                        'xlsx',
                        'xls',
                        'pptx',
                        'ppt',
                        'pdf',
                        'txt',
                      ],
                    );
        
                    if (result != null) {
                      //File file = File();
        
                      // ignore: use_build_context_synchronously
        
                      Navigator.pushNamed(
                        context,
                        OfficeFormat.route,
                        arguments: result.files.single.path.toString(),
                      );
                    } else {
                      // User canceled the picker
                    }
        
                    //
                  },
                ),*/
                  const Card(
                    elevation: 2,
                  ),
                  const Card(
                    elevation: 2,
                  ),
                  const Card(
                    elevation: 2,
                  ),
                  const Card(
                    elevation: 2,
                  ),
                  const Card(
                    elevation: 2,
                  ),
                ],
              ),
            ),
            //appBar: AppBar(title: Center(child: Text("ADAPTA"))),
          ),
          Positioned(
            bottom: 20,
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
    );
  }
}
