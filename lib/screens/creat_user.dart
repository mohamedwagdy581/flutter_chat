import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/header.dart';
class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String username = '';
  final  formKey = GlobalKey<FormState>();
  submitData(){
    formKey.currentState.save();
    Navigator.pop(context , username);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context , titleText: 'Create User'),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('Create User Name'),
                Container(
                  child: Form(
                    key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            onSaved: (val)=>username = val,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                              hintText: 'Must be at least 3 character',
                            ),
                          ),
                          MaterialButton(
                              onPressed: (){
                                submitData();
                              },
                          ),
                        ],
                      ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
