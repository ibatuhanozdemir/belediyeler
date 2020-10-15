

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
import 'belediyeler_objesi.dart';

class BelediyeBilgileri extends StatefulWidget {

  @override
  _BelediyeBilgileriState createState() => _BelediyeBilgileriState();
}

class _BelediyeBilgileriState extends State<BelediyeBilgileri> {

  List<BelediyelerObjesi> belediyeList;
  String SelectedName;
  String URL="images/giris.gif";


  Widget build(BuildContext context) {



    belediyeList = Provider.of<List<BelediyelerObjesi>>(context);

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
              value: SelectedName,
              hint: Text('Belediye Seçiniz'),
              items: belediyeList.map((list){
                return DropdownMenuItem(child:
                Text(list.belediyeisim),
                value: list.belediyeisim);
              }).toList(),
              onChanged: (value){

                setState(() {
                  SelectedName=value;
                  belediyeList.forEach((element) {
                    if(element.belediyeisim==value){
                      URL=element.belediyeurl;
                    }
                  });
                });

              },
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.height * 0.16,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Image.network(URL)),
          ],
        ),
      ),
    );
  }
}
