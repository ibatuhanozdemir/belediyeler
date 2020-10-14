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
                  icon: Icons.account_circle, onTap: () {}, text: "Profil"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
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
                child: Text(" ${Emojis.door} Çıkış Yap"),
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
                image: NetworkImage(
                    "https://www.ibb.istanbul/Uploads/2017/4/corporatelogo.jpg"))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Seçenekler",
                  style: TextStyle(
                      color: Colors.white,
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
