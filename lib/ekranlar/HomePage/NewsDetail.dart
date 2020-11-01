import 'package:belediyeler/ekranlar/HomePage/news1.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NewsDetail extends StatelessWidget {

  String URL;
  String haberbaslik;
  String belediye;
  String tarih;

  int index;

  NewsDetail(this.URL, this.haberbaslik, this.belediye, this.tarih, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: KalipDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF15202B),
        title: Text(haberbaslik),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(belediye),
                Text(tarih),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.35,
                child: Image.network(URL),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            haberbaslik,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          NewsDetail1(index),
        ],
      ),
    );
  }
}