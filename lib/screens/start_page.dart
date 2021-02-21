import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/activityfield.dart';
import 'package:flutter_chat/screens/creat_user.dart';
import 'package:flutter_chat/screens/home.dart';
import 'package:flutter_chat/screens/profile.dart';
import 'package:flutter_chat/screens/search.dart';
import 'package:flutter_chat/screens/timeline.dart';
import 'package:flutter_chat/screens/upload.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isAuth = false;
  PageController pageController = PageController();
  int pageIndex = 0;
  @override
  void initState(){
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account){
      handelSignIn(account);
    },onError: (err){print('Error is $err');});

    try {
      googleSignIn.signInSilently(suppressErrors: false).then((account){
        handelSignIn(account);
      }).catchError((err){
        print('Error in reopen $err');
      });
    } catch (e){
      print('SignInSilently error $e');
    }
  }
  handelSignIn(GoogleSignInAccount account){
    if(account != null){
      creatUserInFirestore();
      setState(() {
        isAuth = true;
      });
    }else{
      setState(() {
        isAuth = false;
      });
    }
  }

  creatUserInFirestore()async{
    // *********** Get Current User  ****************
    final GoogleSignInAccount user = googleSignIn.currentUser;
    // ************* Check if user exists in table users by id *****************
    final DocumentSnapshot doc = await usersRef.document(user.id).get();
    if(!doc.exists){
      // *************** if not exist >>> Create page for add user
      String username = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateUser()));
    }
  }
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  login(){
    googleSignIn.signIn();
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex;
    });
  }

  onTab(int pageIndex){
    pageController.animateToPage(
        pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
    );
  }

  Widget BuildAuthScreen(){
    return Scaffold(
      body: PageView(
        children: <Widget>[
          TimeLine(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Theme.of(context).primaryColor,
        onTap: onTab,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt),),
          BottomNavigationBarItem(icon: Icon(Icons.search),),
          BottomNavigationBarItem(icon: Icon(Icons.person),),
        ],
      ),
    );
  }
  Widget BuildUnAuthScreen(){
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70.0,left: 20.0,bottom: 30.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('Welcome to Chat'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          login();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(30.0),),
                          ),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
      return isAuth ? BuildAuthScreen():BuildUnAuthScreen();
  }
}
