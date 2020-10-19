import 'package:belediyeler/ekranlar/HomePage/belediyelist.dart';
import 'package:belediyeler/ekranlar/HomePage/profil_sayfasi.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KalipDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              _createHeader(),
              _createDrawerItem(
                  icon: Icons.account_circle, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilSayfasi()));
              }, text: "Kişisel Bilgiler"),
              _createDrawerItem(text: "Neleri Takip Ediyorum?",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>belediyeList()));
              }, icon: Icons.assignment_rounded)
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
          ),
          Column(
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                child: Text("${Emojis.door} Çıkış Yap"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "images/haydarpasa.jpg"))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 20.0,
              child: Text("Seçenekler",
                  style: TextStyle(
                      color: Colors.orange.shade900,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
