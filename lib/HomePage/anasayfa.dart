import 'package:belediyeler/HomePage/follow_page_chooser.dart';
import 'package:belediyeler/HomePage/tum_haberler.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/realtimefirebase.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:belediyeler/firebase/profil_ana_sayfa.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  RealTimeDatabase realTimeDatabase = new RealTimeDatabase();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = true;




  void initState() {
    super.initState();
    asyinit().whenComplete(() {
      setState(() {
        loading = false;
      });
      print("success");
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });
  }

  Future<void> asyinit() async {
    await realTimeDatabase.dataformfirebase();
  }

  int _selectedIndex = 0;
  String _title = 'Ana Akış';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Ana Akış';
          }
          break;
        case 1:
          {
            _title = 'Takip Ettiklerim';
          }
          break;
        case 2:
          {
            _title = 'Profil';
          }
          break;
      }
      if (_title == null) {
        _title = 'Ana Akış';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? spinner()
        : StreamProvider<List<UserInfoObjesi>>.value(
            value: DatabaseService().Users,
            catchError: (_, __) => null,
            child: Scaffold(
              drawer: Drawer(),
              body: Stack(
                children: <Widget>[
                  Offstage(
                    offstage: _selectedIndex != 0,
                    child: TickerMode(
                      enabled: _selectedIndex == 0,
                      child: MaterialApp(home: TumHaberler()),
                    ),
                  ),
                  Offstage(
                    offstage: _selectedIndex != 1,
                    child: TickerMode(
                      enabled: _selectedIndex == 1,
                      child: MaterialApp(home: FollowPageChooser()),
                    ),
                  ),
                  Offstage(
                    offstage: _selectedIndex != 2,
                    child: TickerMode(
                      enabled: _selectedIndex == 2,
                      child: MaterialApp(home: ProfilAnaSayfa()),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Ana Akış',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.subscriptions),
                    label: 'Takip Ettiklerim',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box),
                    label: 'Profil',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber,
                onTap: _onItemTapped,
              ),
            ),
          );
  }
}

