import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              GestureDetector(child: Text(Tel, style: TextStyle(color: Colors.blue),),onTap: (){
                launch("tel://$Tel");
              },),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              Text(Faks),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              GestureDetector(child: Text(Mail,style: TextStyle(color: Colors.blue),), onTap: (){
                launch('mailto:$Mail');
              },),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              GestureDetector(child: Text(Web,style: TextStyle(color: Colors.blue),), onTap: (){
                launch('https://$Web');
              },),
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
