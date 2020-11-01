import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:belediyeler/firebase/authentication.dart';
import 'package:belediyeler/firebase/kullanici_objesi.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'belediyelist.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final _formkey = GlobalKey<FormState>();
  String aaa;
  String bbb;
  String ccc;
  static AuthService _authService = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final usersdata = Provider.of<List<UserInfoObjesi>>(context);
    final user = Provider.of<KullaniciObjesi>(context);

    bool loading = false;
    bool editing = false;
    String Name;
    String Surname;
    String Age;
    String Mail;
    if (usersdata == null) {
      loading = true;
    } else {
      Mail = auth.currentUser.email;
      loading = false;
      usersdata.forEach((userdata) {
        if (userdata.uid == user.uid) {
          Name = userdata.name;
          Surname = userdata.surname;
          Age = userdata.age;
        }
      });
    }
    return loading
        ? spinner()
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: false,
              endDrawer: KalipDrawer(),
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF15202B),
                title: Text(
                  "Kişisel Bilgiler",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Center(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(Mail),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: Name,
                              hintStyle: TextStyle(color: Colors.blueGrey)),
                          validator: (val) =>
                              val.isEmpty ? 'İsim giriniz' : null,
                          onChanged: (input) => setState(() => aaa = input),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: Surname),
                          validator: (val) =>
                              val.isEmpty ? 'İsim giriniz' : null,
                          onChanged: (input) => setState(() => bbb = input),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: Age),
                          validator: (val) =>
                              val.isEmpty ? 'İsim giriniz' : null,
                          onChanged: (input) => setState(() => ccc = input),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
