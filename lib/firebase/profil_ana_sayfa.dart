import 'package:belediyeler/HomePage/belediyelist.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:belediyeler/firebase/kullanici_objesi.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../chooser.dart';
import 'authentication.dart';

class ProfilAnaSayfa extends StatefulWidget {
  @override
  _ProfilAnaSayfaState createState() => _ProfilAnaSayfaState();
}

class _ProfilAnaSayfaState extends State<ProfilAnaSayfa> {
  final _formkey = GlobalKey<FormState>();
  String aaa;
  String bbb;
  String ccc;
  static AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final usersdata = Provider.of<List<UserInfoObjesi>>(context);
    final user = Provider.of<KullaniciObjesi>(context);

    bool loading = false;
    String Name;
    String Surname;
    String Age;
    if (usersdata == null) {
      loading = true;
    } else {
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
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xFF15202B),
              title: Text(
                "Profil",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Container(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: Name,
                              hintStyle: TextStyle(color: Colors.black)),
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
                        RaisedButton(
                          onPressed: () async {
                            dynamic result = await _authService.signOut();
                          },
                          child: Text('Çıkış'),
                        ),
                        RaisedButton(
                          elevation: 100,
                          child: Text('Belediye Listesi'),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    belediyeList()));
                          },
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
