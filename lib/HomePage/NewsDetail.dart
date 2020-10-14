import 'package:belediyeler/HomePage/news1.dart';
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                URL,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: 10,
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




