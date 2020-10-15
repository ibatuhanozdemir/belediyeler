import 'package:belediyeler/ekranlar/HomePage/belediyelist.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:belediyeler/firebase/kullanici_objesi.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../chooser.dart';
import 'authentication.dart';

class BelediyeBilgileri extends StatefulWidget {
  @override
  _BelediyeBilgileriState createState() => _BelediyeBilgileriState();
}

class _BelediyeBilgileriState extends State<BelediyeBilgileri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: KalipDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15202B),
        title: Text(
          "Belediye Bilgileri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Bilgi almak istediğiniz belediye:",
              textAlign: TextAlign.center,
            )),
            DropdownButton(

              items: [
                DropdownMenuItem(child: Text("sad")),
                DropdownMenuItem(child: Text("ds")),
                DropdownMenuItem(child: Text("sad")),
                DropdownMenuItem(child: Text("vfvf")),
                DropdownMenuItem(child: Text("dd")),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
