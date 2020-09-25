import 'package:flutter/material.dart';

class AcilisListeElemanWidget extends StatelessWidget {
  @override
  final IconData ikon;
  final String baslik;
  final String altBaslik;
  final String sayfaAdi;

  AcilisListeElemanWidget({this.ikon, this.baslik,this.altBaslik, this.sayfaAdi});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, sayfaAdi);
      },
      child: Card(
        elevation: 50,
        shadowColor: Colors.grey,
        margin: EdgeInsets.all(5),
        color: Colors.white60,
        child: ListTile(
          subtitle: Text(altBaslik),
          leading: Icon(ikon,color: Colors.blueAccent,size: 40,),
          title: Text(baslik, textAlign: TextAlign.start,),
        ),
      ),
    );
  }
}
