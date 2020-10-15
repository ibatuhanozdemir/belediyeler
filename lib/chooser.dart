import 'package:belediyeler/ekranlar/HomePage/anasayfa.dart';
import 'file:///C:/Users/ibatu/AndroidStudioProjects/belediyeler/lib/ekranlar//GirisEkranlari/loginregister.dart';
import 'package:belediyeler/firebase/belediyeler_objesi.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase/kullanici_objesi.dart';

class Chooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<KullaniciObjesi>(context);
    User fbUser = FirebaseAuth.instance.currentUser;

    if (user == null || fbUser.emailVerified == false) {
      return LoginRegister();
    } else {
      return MultiProvider(
        providers: [StreamProvider<DocumentSnapshot>.value(
            value: DatabaseService(uid: user.uid).follow)
          , StreamProvider<List<BelediyelerObjesi>>.value(
            value: DatabaseService().belediyeleer,
          )
        ],
        child: AnaSayfa(),
      );
    }
  }
}