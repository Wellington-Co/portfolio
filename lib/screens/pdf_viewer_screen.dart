import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatelessWidget {
  final String source;
  final bool isAsset;

  const PDFViewerScreen({
    Key? key,
    required this.source,
    this.isAsset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Resume")),
      body: isAsset
          ? SfPdfViewer.asset(source)
          : SfPdfViewer.network(source),
    );
  }
}
