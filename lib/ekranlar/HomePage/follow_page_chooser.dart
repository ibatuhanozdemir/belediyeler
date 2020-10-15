import 'package:belediyeler/ekranlar/HomePage/belediyelist.dart';
import 'package:belediyeler/ekranlar/HomePage/follow.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowPageChooser extends StatefulWidget {
  @override
  _FollowPageChooserState createState() => _FollowPageChooserState();
}

class _FollowPageChooserState extends State<FollowPageChooser> {
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot follows = Provider.of<DocumentSnapshot>(context);
    List aaa = follows.get("follow");
    if (aaa.length == 0) {
      return Scaffold(
        body: Center(
          child: RaisedButton(
            elevation: 100,
            child: Text('Belediye Listesi'),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => belediyeList()));
            },
          ),
        ),
      );
    } else {
      return followPage(context);
    }
  }
}
