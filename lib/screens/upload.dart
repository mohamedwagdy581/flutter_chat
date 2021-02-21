import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context,titleText: 'Upload'),
      body: Center(
        child: Text('Upload'),
      ),
    );
  }
}
