import 'package:belediyeler/HomePage/anasayfa.dart';
import 'package:belediyeler/auth/please_verify.dart';
import 'package:belediyeler/auth/register.dart';
import 'package:belediyeler/chooser.dart';
import 'package:belediyeler/firebase/authentication.dart';
import 'package:belediyeler/firebase/realtimefirebase.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String _email = '', _password = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  bool loading = false;
  final GlobalKey<ScaffoldState> scKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return loading
        ? spinner()
        : Scaffold(
            key: scKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Giriş'),
            ),
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: _formkey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Email bölümü boş bırakılamaz.';
                            }
                          },
                          onChanged: (input) {
                            setState(() => _email = input);
                          },
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Şifre bölümü boş bırakılamaz.';
                            }
                          },
                          onChanged: (input) {
                            setState(() => _password = input);
                          },
                          decoration: InputDecoration(labelText: 'Şifre'),
                          obscureText: true,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            setState(() => loading = true);
                            dynamic result = await _authService
                                .loginWithEmailandPassword(_email, _password);

                            if (result == null) {
                              setState(() => loading = false);
                              print('error');
                            } else {
                              print('sig in');
                              setState(() => loading = false);

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Chooser()));
                            }
                          },
                          child: Text('GİRİŞ'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hesabınız yok mu? Şimdi kaydolun.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF15202B)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          child: Text("Kayıt ol"),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
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