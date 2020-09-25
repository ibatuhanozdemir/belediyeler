


/*
body: Center(
              child: Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: Name,
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (val) => val.isEmpty ? 'İsim giriniz' : null,
                        onChanged: (input) => setState(() => aaa = input),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: Surname),
                        validator: (val) => val.isEmpty ? 'İsim giriniz' : null,
                        onChanged: (input) => setState(() => bbb = input),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: Age),
                        validator: (val) => val.isEmpty ? 'İsim giriniz' : null,
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

 */