import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _recipeCollection = _firestore.collection('recipes');

class RecipeDatabase {
  static Future<void> addRecipe({
    String? userId,
    String? title,
    String? about_recipe,
    String? cooking_method,
    String? ingredient,
    String? time_to_cook,
    String? image,
    String? category,
  }) async {
    DocumentReference documentReference =
    _recipeCollection.doc(DateTime.now().millisecondsSinceEpoch.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "userId": userId,
      "title": title,
      "about_recipe": about_recipe,
      "cooking_method": cooking_method,
      "ingredient": ingredient,
      "time_to_cook": time_to_cook,
      "image": image,
      "category": category,
      "time_stamp": DateTime.now().millisecondsSinceEpoch.toString()
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Recipe added to database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readAllRecipes(uid) {
    String? userId = uid;
    return FirebaseFirestore.instance
        .collection('recipes').where('userId', isNotEqualTo: userId).snapshots();
  }

  static Stream<QuerySnapshot> readUserRecipes(uid) {
    String? userId = uid;
    return FirebaseFirestore.instance
        .collection('recipes').where('userId', isEqualTo: userId).snapshots();
  }

  static Stream<QuerySnapshot> readRecipesByCategory(category) {
    // String? userId = uid;
    print(category);
    Query collection = FirebaseFirestore.instance.collection('recipes').where('category', isEqualTo: '${category} Recipe');
    // if (category == 'Italian Recipe') {
    //   collection = collection.where('category', isEqualTo: category);
    //   return collection.snapshots();
    // }
    // else if (category == 'Punjabi Recipe') {
    //   collection = collection.where('category', isEqualTo: category);
    //   return collection.snapshots();
    // }
    // else if (category == 'Chinese Recipe') {
    //   collection = collection.where('category', isEqualTo: category);
    //   return collection.snapshots();
    // }
    // else if (category == 'Gujrati Recipe') {
    //   collection = collection.where('category', isEqualTo: category);
    //   return collection.snapshots();
    // }
    // else {
    //   collection = collection.where('category', isEqualTo: category);
    //   return collection.snapshots();
    // }
    return collection.snapshots();
  }

  static Stream<QuerySnapshot> readSearchRecipes(searchText) {
    // String? userId = uid;
    // Query collection = FirebaseFirestore.instance.collection('recipes').where("title", isGreaterThanOrEqualTo: searchText);
    Query collection = FirebaseFirestore.instance.collection('recipes').where("title", isEqualTo: searchText);
    // collection = collection.where("title", isGreaterThanOrEqualTo: searchText).where("title", isLessThanOrEqualTo: "${searchText}\uf7ff");
    return collection.snapshots();
  }

// final CollectionReference _recipeCollection = _firestore.collection('users');

// class RecipeDatabase {
//   static Future<void> addRecipe({
//     String? userId,
//     String? title,
//     String? about_recipe,
//     String? cooking_method,
//     String? ingredient,
//     String? time_to_cook,
//     String? image,
//     String? category,
//   }) async {
//     DocumentReference documentReference =
//     _recipeCollection.doc(userId).collection("recipes").doc(DateTime.now().millisecondsSinceEpoch.toString());
//
//     Map<String, dynamic> data = <String, dynamic>{
//       "userId": userId,
//       "title": title,
//       "about_recipe": about_recipe,
//       "cooking_method": cooking_method,
//       "ingredient": ingredient,
//       "time_to_cook": time_to_cook,
//       "image": image,
//       "category": category,
//     };
//     await documentReference
//         .set(data)
//         .whenComplete(() => print("Recipe added to database"))
//         .catchError((e) => print(e));
//   }
//
//   static Future<void> updateRecipe({
//     String? docId,
//     String? userId,
//     String? title,
//     String? about_recipe,
//     String? cooking_method,
//     String? ingredient,
//     String? time_to_cook,
//     String? image,
//     String? category,
//   }) async {
//     DocumentReference documentReference =
//     _recipeCollection.doc(userId).collection("recipes").doc(docId);
//
//     Map<String, dynamic> data = <String, dynamic>{
//       "title": title,
//       "about_recipe": about_recipe,
//       "cooking_method": cooking_method,
//       "ingredient": ingredient,
//       "time_to_cook": time_to_cook,
//       "image": image,
//       "category": category,
//     };
//     await documentReference
//         .set(data)
//         .whenComplete(() => print("Recepi updated int the database"))
//         .catchError((e) => print(e));
//   }
//
//   static Stream<QuerySnapshot> readRecipes(uid) {
//     String? userId = uid;
//     CollectionReference collectionReference = _recipeCollection.doc(userId).collection('recipes');
//     print(collectionReference);
//     print("%%%%%%%%%%%%%%%%%%%%");
//     return collectionReference.snapshots();
//   }
//
//   // static Stream<QuerySnapshot> readAllRecipes(uid) {
//   //   String? userId = uid;
//   //   final documentSnapshot = _recipeCollection.where(FieldPath.documentId, isNotEqualTo: userId).get();
//   //
//   //   final data = documentSnapshot.then((value) => value.docs.where((element) => print(element.get(timr))));
//   //   // print(data);
//   //   print("%%%%%%%%%%%%%%%%%%%%");
//   //   CollectionReference collectionReference = _recipeCollection.doc().collection('recipes');
//   //   return collectionReference.snapshots();
//   // }
//
//   static Future<void> deleteRecipe({
//     String? docId,
//     String? userId,
//   }) async {
//     DocumentReference documentReference =
//     _recipeCollection.doc(userId).collection("recipes").doc(docId);
//
//     await documentReference
//         .delete()
//         .whenComplete(() => print("Recipe deleted from database"))
//         .catchError((e) => print(e));
//   }
}