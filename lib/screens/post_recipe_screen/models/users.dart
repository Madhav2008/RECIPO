import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _userCollection = _firestore.collection('users');

class UserDatabase {
  static Future<void> addUser({
    required String userId,
    required String userName,
    required String userEmail,
    required String contact,
    required String bio,
    required String img,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("userDetails").doc(DateTime.now().millisecondsSinceEpoch.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "userId": userId,
      "userName": userName,
      "userEmail": userEmail,
      "bio": bio,
      "following": 0,
      "follower": 0,
      "contact": contact,
      "img": img,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("User added Successfully"))
        .catchError((e) => print(e));
  }

  static Future<void> addUserIandB({
    required String bio,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc().collection("userDetails").doc();

    Map<String, dynamic> data = <String, dynamic>{
      "bio": bio,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("User Image and Bio added Successfully"))
        .catchError((e) => print(e));
  }

  static Future<void> updateUser({
    required String docId,
    required String userId,
    required String userName,
    required String userEmail,
    required String following,
    required String follower,
    required String like,
    required String imageUrl,
    required String bio,
    required String favourites,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("users").doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "userId": userId,
      "userName": userName,
      "userEmail": userEmail,
      "following": 0,
      "follower": 0,
      "like": 0,
      "image": imageUrl,
      "bio": bio,
      "favourites": 0,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("User updated Successfully"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readUsers(uid) {
    String? userId = uid;
    CollectionReference collectionReference = _userCollection.doc(userId).collection('userDetails');
    print(collectionReference);
    return collectionReference.snapshots();
  }

  static Future<void> deleteUser({
    required String docId,
    required String userId,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("users").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("User deleted Successfully"))
        .catchError((e) => print(e));
  }
}