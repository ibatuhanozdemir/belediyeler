import 'package:flutter/material.dart';

class BelediyeAyrintilariWidgeti extends StatelessWidget {

  String Tel;
  String Faks;
  String Mail;
  String Web;
  String Nufus;
  BelediyeAyrintilariWidgeti(this.Tel,this.Faks, this.Mail, this.Web, this.Nufus);





  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Belediye Telefon : $Tel'),
          Text('Belediye Faks : $Faks'),
          Text('Belediye Mail : $Mail'),
          Text('Belediye Web : $Web'),
          Text('Belediye Nufus : $Nufus'),
        ],
      ),



    );
  }
}