import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travelapp/models/user.dart';
import 'package:travelapp/services/auth.dart';
import 'package:travelapp/services/database.dart';
import 'package:travelapp/shared/loading.dart';

class HomeMenuDrawer extends StatefulWidget {

  final User user;
  HomeMenuDrawer({this.user,Key key}) : super(key: key);

  _HomeMenuDrawerState createState() => _HomeMenuDrawerState();
}

class _HomeMenuDrawerState extends State<HomeMenuDrawer> {


  @override
  Widget build(BuildContext context) {
  print(widget.user.uid);
    return StreamBuilder(
      stream: DatabaseService(uid: widget.user.uid).getData,
      builder: (context,snapshot){

          if(snapshot.hasData){

            UserData user = snapshot.data;
            return ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text("${user.firstName} ${user.lastName}"),
                  accountEmail: Row(
                    children: <Widget>[
                      Text("${user.emailId}"),

                    ],
                  ),
                  currentAccountPicture: ClipOval(
                    child: Container(
                      //height: _height / 5.5,
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.0,
                              color: Colors.black26,
                              offset: Offset(1.0, 10.0),
                              blurRadius: 20.0),
                        ],
                        image: DecorationImage(
                            image: user.profileimage == null
                                ? AssetImage('assets/images/login.png',)
                                : FileImage(File(user.profileimage)),

                            fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  linkMenuDrawer('Payment', () {
                    Navigator.pushNamed(context, '/payment');
                  }),
                  linkMenuDrawer('Your Trips', () {
                    Navigator.pushNamed(context, '/your_trip');
                  }),
                  linkMenuDrawer('Help', () {
                    Navigator.pushNamed(context, '/help');
                  }),
                  linkMenuDrawer('Log Out', () {
                    AuthServices().signOut();
                    //Navigator.pushNamed(context, '/settings');
                  }),
                ]),
              ],
            );
          }else{
            return Loading();
          }
      },
    );
  }
}

Widget linkMenuDrawer(String title, Function onPressed) {
  return InkWell(
    onTap: onPressed,
    splashColor: Colors.black,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: 15.0),
      ),
    ),
  );
}
