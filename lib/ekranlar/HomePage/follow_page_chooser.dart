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
        endDrawer: KalipDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF15202B),
          title: Text("Takip Ettiklerim"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Takip etmek için belediye seçiniz'),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              RaisedButton(
                elevation: 100,
                color: Colors.red,
                child: Text('Belediye Listesi',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => belediyeList()));
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return followPage(context);
    }
  }
}
