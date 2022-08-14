/*
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:adapta/widgets/widgets.dart';

class OpenPdf extends StatelessWidget {
  const OpenPdf({Key? key}) : super(key: key);

  static const String route = 'openpdf';

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments;

    return PDFView(
      filePath: file.toString(),
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: true,
      pageFling: true,
      onRender: (_pages) {
        /*setState(() {
              pages = _pages;
              isReady = true;
            });*/
      },
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        //_controller.complete(pdfViewController);
      },
      /*onPageChanged: (int page, int total) {
            //print('page change: $page/$total');
          },*/
    );
  }
}
*/

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OpenPdf extends StatefulWidget {
  static const String route = 'openpdf';

  const OpenPdf({Key? key}) : super(key: key);

  @override
  State<OpenPdf> createState() => _OpenPdfState();
}

class _OpenPdfState extends State<OpenPdf> {
  late PdfViewerController _pdfViewerController;
  //late PdfTextSearchResult _searchResult;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final file = ModalRoute.of(context)!.settings.arguments;
    final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Syncfusion Flutter PdfViewer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {
              _searchResult = await _pdfViewerController.searchText('El Plan',
                  searchOption: TextSearchOption.caseSensitive);
              print(
                  'Total instance count: ${_searchResult.totalInstanceCount}');
            },
          ),
        ],
      ),*/
      body: SfPdfViewer.file(
        File(file.toString()),
        controller: _pdfViewerController,
        currentSearchTextHighlightColor: Colors.yellow,
        key: pdfViewerKey,
      ),
    );
  }
}
