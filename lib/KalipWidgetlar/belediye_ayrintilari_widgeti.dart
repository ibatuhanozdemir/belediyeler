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
    return SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Belediye Telefon : '),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text('Belediye Faks : '),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text('Belediye Mail : '),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text('Belediye Web : '),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text('Belediye Nufus : '),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.12),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(Tel),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(Faks),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(Mail),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(Web),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(Nufus),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        ],
      ),
    );
  }
}
