import 'dart:io';

import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class DisplayImage extends StatelessWidget {
  static const String route = 'displayimage';

  const DisplayImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments;

    return PhotoView(
      imageProvider: FileImage(
        File(file.toString()),
      ),
    );
    //Image.file(File(file.toString()));
  }
}
