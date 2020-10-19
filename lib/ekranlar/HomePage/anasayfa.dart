import 'package:belediyeler/ekranlar/HomePage/follow_page_chooser.dart';
import 'package:belediyeler/ekranlar/HomePage/tum_haberler.dart';
import 'package:belediyeler/KalipWidgetlar/kalip_drawer.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/realtimefirebase.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:belediyeler/firebase/belediye_bilgileri.dart';
import 'package:belediyeler/shared/spinner.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
            child: GestureDetector(
              onTap: (){
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(

                  children: <Widget>[
                    Offstage(
                      offstage: _selectedIndex != 0,
                      child: TickerMode(
                        enabled: _selectedIndex == 0,
                        child: MaterialApp(home: TumHaberler(),debugShowCheckedModeBanner: false,),
                      ),
                    ),
                    Offstage(
                      offstage: _selectedIndex != 1,
                      child: TickerMode(
                        enabled: _selectedIndex == 1,
                        child: MaterialApp(home: FollowPageChooser(),debugShowCheckedModeBanner: false,),
                      ),
                    ),
                    Offstage(
                      offstage: _selectedIndex != 2,
                      child: TickerMode(
                        enabled: _selectedIndex == 2,
                        child: MaterialApp(home: BelediyeBilgileri(),debugShowCheckedModeBanner: false,),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: ConvexAppBar(
                  items: [
                    TabItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: 'Ana Akış',
                    ),
                    TabItem(
                      icon: Icon(
                        Icons.subscriptions,
                        color: Colors.white,
                      ),
                      title: 'Takip Ettiklerim',
                    ),
                    TabItem(
                      icon: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: 'Belediye Bilgileri',
                    ),
                  ],
                  initialActiveIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  backgroundColor: Colors.red,
                  activeColor: Colors.red.shade600,
                  top: -5,
                  curveSize: 10,
                ),
              ),
            ),
          );
  }
}
