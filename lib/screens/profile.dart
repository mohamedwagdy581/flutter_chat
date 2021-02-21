import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context,titleText: 'Profile'),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
