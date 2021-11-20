import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _userCollection = _firestore.collection('users');

class UserDatabase {
  static Future<void> addUser({
    String userId,
    String userName,
    String userEmail,
    String following,
    String follower,
    String like,
    String imageUrl,
    String bio,
    String favourites,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("userDetails").doc(DateTime.now().millisecondsSinceEpoch.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "userId": userId,
      "userName": userName,
      "userEmail": userEmail,
      "following": 0,
      "follower": 0,
      "like": 0,
      "imageUrl": imageUrl,
      "bio": bio,
      "favourites": 0,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("User added Successfully"))
        .catchError((e) => print(e));
  }

  static Future<void> updateUser({
    String docId,
    String userId,
    String userName,
    String userEmail,
    String following,
    String follower,
    String like,
    String imageUrl,
    String bio,
    String favourites,
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

  static Stream<QuerySnapshot> readUsers() {
    String userId;
    CollectionReference collectionReference = _userCollection.doc(userId).collection('users');
    print(collectionReference);
    return collectionReference.snapshots();
  }

  static Future<void> deleteUser({
    String docId,
    String userId,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("users").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("User deleted Successfully"))
        .catchError((e) => print(e));
  }
}