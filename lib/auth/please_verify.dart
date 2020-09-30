import 'package:flutter/material.dart';

import 'login.dart';

class PleaseVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesabınızı doğrulayın"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lütfen size göndermiş olduğumuz mail üzerinden hesabınızı doğrulayın", textAlign: TextAlign.center,),
                SizedBox(height: 15,),
                Text("Eğer doğruladıysanız 'Giriş Yap' butonuna tıklayarak hesabınıza gireiblirsiniz",textAlign: TextAlign.center,),
                SizedBox(height: 15,),
                RaisedButton(child: Text("Giriş yap"),
                onPressed: (){
                  return Login();
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
