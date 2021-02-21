import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context,titleText: 'Search'),
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
