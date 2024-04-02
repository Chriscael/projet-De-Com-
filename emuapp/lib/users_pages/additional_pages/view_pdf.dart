// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatefulWidget {
  final String pdfId;

  const PDFViewer({required Key key, required this.pdfId}) : super(key: key);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  late String _pdfUrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPDF();
  }

  Future<void> _fetchPDF() async {
    try {
      // Fetch PDF from server using its ID
      var response = await http.get(Uri.parse('http://localhost:8000/getPDF/${widget.pdfId}'));

      if (response.statusCode == 200) {
        setState(() {
          // Set PDF URL for PDFView widget
          _pdfUrl = 'data:application/pdf;base64,${base64Encode(response.bodyBytes)}';
          _isLoading = false;
        });
      } else {
        // Handle error
        print('Failed to fetch PDF: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or server errors
      print('Error fetching PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: _pdfUrl,
            ),
    );
  }
}
