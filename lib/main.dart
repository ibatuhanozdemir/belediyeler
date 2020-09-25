import 'package:belediyeler/chooser.dart';
import 'package:belediyeler/firebase/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase/kullanici_objesi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return StreamProvider<KullaniciObjesi>.value(
            value: AuthService().user,
            child: MaterialApp(
              theme: ThemeData(
                primaryColor: Color(0xFF15202B),
              ),
              debugShowCheckedModeBanner: true,
              home: Scaffold(
                drawer: Drawer(),
                body: Chooser(),
              ),
            ),
          );
        });
  }
}
