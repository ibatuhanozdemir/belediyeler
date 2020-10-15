import 'package:belediyeler/ekranlar/HomePage/NewsDetail.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/haberler_objesi.dart';
import 'package:belediyeler/firebase/realtimefirebase.dart';
import 'package:belediyeler/firebase/kullanici_objesi.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TumHaberler extends StatefulWidget {
  @override

  _TumHaberlerState createState() => _TumHaberlerState();
}

class _TumHaberlerState extends State<TumHaberler> {

  List<HaberlerObjesi> postList = [];
  List tarih = [];
  String post2;
  var aaa;
  var bbb;
  int i = 1;
  int c = 5;
  IconData icon = Icons.favorite_border;

  bool loading = true;
  bool loading1 = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    //int i = 1;
    postList = [];
    tarih = [];
    super.initState();
    getData5();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        for (var a = 0; a < 3; a++) {
          getData(c);
          c = c + 1;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot follows = Provider.of<DocumentSnapshot>(context);
    return loading
        ? spinner()
        : Scaffold(
            endDrawer: KalipDrawer(),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xFF15202B),
              title: Text(
                "Ana Akış",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: ListView.builder(
              controller: _scrollController,
              itemBuilder: (_, index) {
                return newsUI(
                    postList[index].haberbaslik,
                    postList[index].url,
                    postList[index].belediye,
                    postList[index].tarih,
                    index,
                    follows);
              },
              itemCount: postList.length,
            ),
          );
  }

  Widget newsUI(String haberbaslik, String URL, String belediye, String tarih,
      int index, DocumentSnapshot follows) {
    var aaa = 0;

    final user = Provider.of<KullaniciObjesi>(context);
    List asdf = follows.get('follow');
    if (asdf.length == 0) {
      icon = Icons.favorite_border;
    } else {
      for (var i = 0; i < asdf.length; i++) {
        if (belediye == asdf[i]) {
          icon = Icons.favorite;
          aaa = aaa + 1;
          break;
        } else {
          icon = Icons.favorite_border;
        }
      }
    }

    return GestureDetector(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.28,
          child: Card(
            color: Colors.blueGrey.shade100,
            elevation: 100,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(belediye),
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(tarih)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.height * 0.16,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Image.network(URL),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(haberbaslik),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.height * 0.05,
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              if (aaa == 0) {
                                DatabaseService _databaseService =
                                    new DatabaseService(uid: user.uid);
                                dynamic result =
                                    _databaseService.updateUserFollow(belediye);
                              } else {
                                DatabaseService _databaseService =
                                    new DatabaseService(uid: user.uid);
                                dynamic result =
                                    _databaseService.deleteUserFollow(belediye);
                              }
                            });
                          },
                          child: Icon(icon)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NewsDetail(URL, haberbaslik, belediye, tarih, index)));
      },
    );
  }

  getData(int b) async {
    DatabaseReference postref2 = FirebaseDatabase.instance
        .reference()
        .child('haberler')
        .child(RealTimeDatabase.tarih[b]['belediyeismi'])
        .child(RealTimeDatabase.tarih[b]['name']);
    await postref2.once().then((DataSnapshot snap) {
      var DATA = snap.value;

      HaberlerObjesi news1 = new HaberlerObjesi(
        DATA['haberbaslik'],
        DATA['url'],
        DATA['belediye'],
        DATA['tarih'],
      );

      print("get data");
      setState(() {
        postList.add(news1);

        loading = false;
      });
    });
  }

  getData5() {
    for (int b = 0; b < 5; b++) {
      getData(b);
    }
  }
}
