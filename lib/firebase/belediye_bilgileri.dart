import 'package:belediyeler/KalipWidgetlar/belediye_ayrintilari_widgeti.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'belediyeler_objesi.dart';

class BelediyeBilgileri extends StatefulWidget {
  @override
  _BelediyeBilgileriState createState() => _BelediyeBilgileriState();
}

class _BelediyeBilgileriState extends State<BelediyeBilgileri> {
  List<BelediyelerObjesi> belediyeList;
  String SelectedName;
  String URL = "images/giris.gif";
  List BelediyeBilgileriList = [
    {
      'Belediye Tel': '',
      'Belediye Faks': '',
      'Belediye Mail': '',
      'Belediye Web': '',
      'Nufus': ''
    }
  ];

  Widget build(BuildContext context) {
    belediyeList = Provider.of<List<BelediyelerObjesi>>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: DropdownButton(
                    itemHeight: MediaQuery.of(context).size.height * 0.10,
                    value: SelectedName,
                    hint: Text('Belediye Seçiniz'),
                    items: belediyeList.map((list) {
                      return DropdownMenuItem(
                          child: Card(
                              elevation: 0,
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    width: MediaQuery.of(context).size.height *
                                        0.10,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    child: Image.network(list.belediyeurl),
                                  ),
                                  Text(list.belediyeisim),
                                ],
                              )),
                          value: list.belediyeisim);
                    }).toList(),
                    onChanged: (value) async {
                      var result =
                      await DatabaseService().BelediyeBilgileri(value);
                      print(result);
                      setState(() {
                        BelediyeBilgileriList = result;

                        SelectedName = value;
                        belediyeList.forEach((element) {
                          if (element.belediyeisim == value) {
                            URL = element.belediyeurl;
                          }
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
            Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Image.network(URL)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  BelediyeAyrintilariWidgeti(
                      BelediyeBilgileriList[0]['Belediye Tel'],
                      BelediyeBilgileriList[0]['Belediye Faks'],
                      BelediyeBilgileriList[0]['Belediye Mail'],
                      BelediyeBilgileriList[0]['Belediye Web'],
                      BelediyeBilgileriList[0]['Nufus']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}