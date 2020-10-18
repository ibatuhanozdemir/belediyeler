import 'package:belediyeler/firebase/belediyeler_objesi.dart';
import 'package:belediyeler/firebase/user_info_objesi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('Users');
  final CollectionReference userCollection1 =
  FirebaseFirestore.instance.collection('belediyeler');
  final CollectionReference userCollection2 =
  FirebaseFirestore.instance.collection('belediyelerinfo');

  Future updateUserData(String name, String surname, String age) async {
    try {
      return await userCollection.doc(uid).set({
        'name': name,
        'surname': surname,
        'age': age,
        'uid': uid,
        'follow': FieldValue.arrayUnion([]),
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future update2UserData(String name, String surname, String age) async {
    try {
      return await userCollection.doc(uid).update({
        'name': name,
        'surname': surname,
        'age': age,
        'uid': uid,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  List<UserInfoObjesi> userfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserInfoObjesi(
        name: doc.get('name'),
        surname: doc.get('surname'),
        age: doc.get('age'),
        uid: doc.get('uid'),
      );
    }).toList();
  }

  Stream<List<UserInfoObjesi>> get Users {
    return userCollection.snapshots().map(userfromsnapshot);
  }

  DocumentSnapshot usersfollow(DocumentSnapshot snapshot) {
    return snapshot;
  }

  Stream<DocumentSnapshot> get follow {
    return userCollection.doc(uid).snapshots().map(usersfollow);
  }

  List<BelediyelerObjesi> belediyeler(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BelediyelerObjesi(
        belediyeisim: doc.get('isim'),
        belediyeurl: doc.get('URL'),
      );
    }).toList();
  }

  Stream<List<BelediyelerObjesi>> get belediyeleer {
    return userCollection1.snapshots().map(belediyeler);
  }

  Future updateUserFollow(String belediye) async {
    try {
      return await userCollection.document(uid).updateData({
        'follow': FieldValue.arrayUnion([belediye])
        //'follow': FieldValue.arrayRemove(['ABB'])
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteUserFollow(String belediye) async {
    try {
      return await userCollection.document(uid).updateData({
        //'follow': FieldValue.arrayUnion([belediye])
        'follow': FieldValue.arrayRemove([belediye])
      });
    } catch (e) {
      print(e.toString());
    }
  }
  Future BelediyeBilgileri(String belediyeisim) async {
    try {
      var result=await userCollection2.doc(belediyeisim).get();
      List BelediyeBilgileriList=[{'Belediye Tel': result.get('Belediye Tel'),'Belediye Faks':result.get('Belediye Faks'),'Belediye Mail':result.get('Belediye Mail'),'Belediye Web':result.get('Belediye Web'),'Nufus':result.get('Nufus')}];

      return BelediyeBilgileriList;
    } catch (e) {
      print(e.toString());
    }
  }
}