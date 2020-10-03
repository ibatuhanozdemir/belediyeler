import 'package:belediyeler/auth/login.dart';
import 'package:belediyeler/firebase/authentication.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = '', _password = '', _name = '', _surname = '';
  String _age = '';
  String snackBarText = "Lütfen girdiğiniz bilgileri kontrol edin.";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final GlobalKey<ScaffoldState> scKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(snackBarText),
      duration: Duration(seconds: 1),
    );
    return Scaffold(
      key: scKey,
      appBar: AppBar(
        title: Text('Kayıt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onChanged: (input) {
                      input.trim();
                      setState(() => _email = input);
                      snackBarArranger();
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    onChanged: (input) {
                      input.trim();
                      setState(() => _password = input);
                      snackBarArranger();
                    },
                    decoration: InputDecoration(labelText: 'Şifre'),
                    obscureText: true,
                  ),
                  TextFormField(
                    onChanged: (input) {
                      input.trim();
                      setState(() => _name = input);
                      snackBarArranger();
                    },
                    decoration: InputDecoration(labelText: 'İsim'),
                  ),
                  TextFormField(
                    onChanged: (input) {
                      input.trim();
                      setState(() => _surname = input);
                      snackBarArranger();
                    },
                    decoration: InputDecoration(labelText: 'Soyisim'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (input) {
                      input.trim();
                      setState(() => _age = input);
                      snackBarArranger();
                    },
                    decoration: InputDecoration(labelText: 'Yaş'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_name.length < 3 ||
                          _surname.length < 3 ||
                          int.tryParse(_age) <= 7 ||
                          int.tryParse(_age) >= 100) {
                        scKey.currentState.showSnackBar(snackBar);
                      } else {
                        scKey.currentState.showSnackBar(snackBar);
                        dynamic result =
                            await _authService.registerWithEmailandPassword(
                                _email, _password, _name, _surname, _age);
                        if (result == null) {
                          print('error');
                        } else {
                          print('sign in');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      }
                    },
                    child: Text('Kaydı Tamamla'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  snackBarArranger() {
    setState(() {

    });
    if (_email.length < 3 || !_email.contains("@")) {
      setState(() {
        snackBarText = "Lütfen geçerli bir mail adresi giriniz";
      });
    } else if (_password.length < 6) {
      setState(() {
        snackBarText = "Lütfen 5 karakterden uzun bir şifre belirleyin.";
      });
    } else if (_name.length < 2) {
      setState(() {
        snackBarText = "Lütfen geçerli bir isim giriniz";
      });

    } else if (_surname.length < 3) {
      setState(() {
        snackBarText = "Lütfen geçerli bir soyisim giriniz";
      });
    } else if (int.tryParse(_age) <= 7 || int.tryParse(_age) >= 110) {
      setState(() {
        snackBarText = "Lütfen geçerli bir yaş giriniz";
      });
    }

    }
  }

