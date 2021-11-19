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
    String favorites,
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
      "favorites": 0,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("User added Successfully"))
        .catchError((e) => print(e));
  }

  static Future<void> updateRecipe({
    String docId,
    String userId,
    String userName,
    String userEmail,
    String following,
    String follower,
    String like,
    String imageUrl,
    String bio,
    String favorites,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("recipes").doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      // "title": title,
      // "about_recipe": about_recipe,
      // "cooking_method": cooking_method,
      // "calorie": calorie,
      // "ingredient": ingredient,
      // "sub_ingredient": sub_ingredient,
      // "time_to_cook": time_to_cook,
      // "image": image,
      // "category": category,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Recepi updated int the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readRecipes() {
    String userId;
    CollectionReference collectionReference = _userCollection.doc(userId).collection('recipes');
    print(collectionReference);
    return collectionReference.snapshots();
  }

  static Future<void> deleteRecipe({
    String docId,
    String userId,
  }) async {
    DocumentReference documentReference =
    _userCollection.doc(userId).collection("recipes").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("Recipe deleted from database"))
        .catchError((e) => print(e));
  }
}

class Users {
  String name;
  String imageUrl;
  String email;
  List<String> reviews;
  int follower;
  int following;

  Users({
    this.name,
    this.imageUrl,
    this.email,
    this.reviews,
    this.follower,
    this.following,
  });
}

final List<Users> users = [
  Users(
    imageUrl: 'assets/images/profile1.png',
    name: 'John Wick',
    email: 'john@gmail.com',
    follower: 56,
    following: 150,
  ),
  Users(
    imageUrl: 'assets/images/profile2.png',
    name: 'Ted',
    email: 'john@gmail.com',
    follower: 100,
    following: 50,
  ),
  Users(
    imageUrl: 'assets/images/profile3.png',
    name: 'Philipe',
    email: 'john@gmail.com',
    follower: 20,
    following: 0,
  ),
  Users(
    imageUrl: 'assets/images/profile4.png',
    name: 'Morgan',
    email: 'john@gmail.com',
    follower: 800,
    following: 2000,
  ),
  Users(
    imageUrl: 'assets/images/profile6.png',
    name: 'Mike',
    email: 'john@gmail.com',
    follower: 56,
    following: 150,
  ),
  Users(
    imageUrl: 'assets/images/profile7.png',
    name: 'Miller',
    email: 'john@gmail.com',
    follower: 56,
    following: 150,
  ),
  Users(
    imageUrl: 'assets/images/profile8.png',
    name: 'Tim',
    email: 'john@gmail.com',
    follower: 56,
    following: 150,
  ),
];
