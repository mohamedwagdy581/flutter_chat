import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context,titleText: 'ActivityFeed'),
      body: Center(
        child: Text('ActivityFeed'),
      ),
    );
  }
}
