import 'package:belediyeler/firebase/realtimefirebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetail2 extends StatefulWidget {
  @override
  int index;
  String belediye;
  NewsDetail2(this.index,this.belediye);

  _NewsDetail1State createState() => _NewsDetail1State(index,belediye);
}

class _NewsDetail1State extends State<NewsDetail2> {
  int index;
  String belediye;
  _NewsDetail1State(this.index,this.belediye);

  String haber1;
  List<Widget> Liste = [];
  List followhaber=[];
  @override
  void initState() {
    // TODO: implement initState
    Liste = [];
    followhaber=[];
    super.initState();
    getData(index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Liste[index];
        },
        itemCount: Liste.length,
      ),
    );
  }

  Widget Text1(String Haber) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(Haber, style: TextStyle(
              fontWeight: fw(Haber.length), fontFamily: 'Roboto'),),

        ],
      ),
    );
  }

  getData(int b) async {
    RealTimeDatabase.tarih.forEach((element) {
      if(belediye==element['belediyeismi']){
        followhaber.add(element);
      }

    });
    DatabaseReference postref2 = FirebaseDatabase.instance
        .reference()
        .child('haberler')
        .child(followhaber[b]['belediyeismi'])
        .child(followhaber[b]['name']);
    await postref2.once().then((DataSnapshot snap) {
      var DATA = snap.value;
      var iceriksayisi = DATA['iceriksayisi'];
      for (int i = 1; i < iceriksayisi + 1; i++) {
        haber1 = DATA['habericerik' + i.toString()];

        setState(() {
          Liste.add(Text1(haber1));
        });
      }
    });
  }

  FontWeight fw(int number) {
    if (number < 100) {
      return FontWeight.w700;
    }
  }
}
