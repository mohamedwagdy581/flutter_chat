import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Network',
      theme: ThemeData(
        primaryColor: Colors.blue[400],
        accentColor: Colors.green[400],
      ),
      home: StartPage(),
    );
  }
}
