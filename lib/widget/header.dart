import 'package:flutter/material.dart';

AppBar Header(context , {bool isAppTitle = false, String titleText}){
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    centerTitle: true,
    title: Text(
      isAppTitle ? 'Social Chat' : titleText,
      style: TextStyle(
        fontSize: isAppTitle ? 30.0 : 20.0 ,
        fontFamily: isAppTitle ? 'Signatra' : '',
        color: Colors.white
      ),
    ),
  );
}