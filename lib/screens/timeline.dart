import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';
import 'package:flutter_chat/widget/progress.dart';


final usersRef = Firestore.instance.collection('users');

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<dynamic> users = [];

  // *********************  Get User from Firebase  ****************************

  getUsers()async{
    QuerySnapshot snapshot = await usersRef.getDocuments();
    setState(() {
      users = snapshot.documents;
    });
  }

  // ********************  Create User to Firebase  ****************************

  /*CreateUser(){
    usersRef.document('123456').setData({
      'name' : 'Wazeer',
      'isAdmin' : false,
      'postsCount' : 4,
    });
  }*/

  // ********************  Update User to Firebase  ****************************

  /*UpdateUser()async{
    final DocumentSnapshot doc = await usersRef.document('123456').get();
    if (doc.exists){
      doc.reference.updateData({
        'name' : 'Wagdy',
        'isAdmin' : true,
        'postsCount' : 20,
      });
    }
  }*/

  // ********************  Delete User to Firebase  ****************************



  /*getUsersById()async{
    final String id = 'IihYnQStSbPbsuH6nRsp';
    QuerySnapshot snapshot = await usersRef.getDocuments();
    final DocumentSnapshot doc = await usersRef.document(id).get();
    print(doc.data);
    print(doc.documentID);
    print(doc.exists);
    setState(() {
      users = snapshot.documents;
    });
  }*/

  // ************** InitState for Reloading all thing in our App ***************

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
    /*CreateUser();
    UpdateUser();
    DeleteUser();*/
  }

  // *******************  The Begging of Scaffold in App  **********************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context,isAppTitle: true),
      body: Container(
        child: Center(child: Text('TimeLine')),
      ),
      /*StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
          builder: (context , snapshot){
          if(!snapshot.hasData){
            return CircularProgress();
          }
          List<Text> child = snapshot.data.documents.map((user)=>Text(user['name'])).toList();
          return ListView(
            children: child,
          );
          },
      ),*/
    );
  }
}
