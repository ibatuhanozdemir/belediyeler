import 'package:belediyeler/firebase/belediyeler_objesi.dart';
import 'package:belediyeler/firebase/firebase.dart';
import 'package:belediyeler/firebase/kullanici_objesi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class belediyeList extends StatefulWidget {
  @override
  _belediyeListState createState() => _belediyeListState();
}

class _belediyeListState extends State<belediyeList> {
  @override
  List<BelediyelerObjesi> belediyeList;

  Widget build(BuildContext context) {
    var follows = Provider.of<DocumentSnapshot>(context);
    final user = Provider.of<KullaniciObjesi>(context);
    belediyeList = Provider.of<List<BelediyelerObjesi>>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF15202B),
        title: Text("Belediyeler",),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return belediyeCard(belediyeList, index, context, user.uid, follows);
        },
        itemCount: belediyeList.length,
      ),
    );
  }
}

Widget belediyeCard(List<BelediyelerObjesi> belediyeList, int index,
    BuildContext context, String uid, DocumentSnapshot follows) {
  var aaa = 0;
  IconData icon = Icons.favorite_border;
  List asdf = follows.get('follow');
  if (asdf.length == 0) {
    icon = Icons.favorite_border;
  } else {
    for (var i = 0; i < asdf.length; i++) {
      if (belediyeList[index].belediyeisim == asdf[i]) {
        icon = Icons.favorite;
        aaa = aaa + 1;
        break;
      } else {
        icon = Icons.favorite_border;
      }
    }
  }
  return GestureDetector(
    child: Card(
      color: Colors.blueGrey.shade100,
      elevation: 100,
      child: Row(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.height * 0.16,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Image.network(belediyeList[index].belediyeurl)),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(belediyeList[index].belediyeisim),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.height * 0.05,
            child: Icon(icon),
          )
        ],
      ),
    ),
    onTap: () async {
      if (aaa == 0) {
        DatabaseService _databaseService = new DatabaseService(uid: uid);
        dynamic result =
            _databaseService.updateUserFollow(belediyeList[index].belediyeisim);
      } else {
        DatabaseService _databaseService = new DatabaseService(uid: uid);
        dynamic result =
            _databaseService.deleteUserFollow(belediyeList[index].belediyeisim);
      }
    },
  );
}
