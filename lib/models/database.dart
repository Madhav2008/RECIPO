import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _recipeCollection = _firestore.collection('recipe');

class RecipeDatabase {
  static Future<void> addRecipe({
    String userId,
    String title,
    String about_recipe,
    String cooking_method,
    String calorie,
    String ingredient,
    String sub_ingredient,
    String time_to_cook,
    String image,
  }) async {
    DocumentReference documentReference =
    _recipeCollection.doc(userId).collection("recipes").doc(DateTime.now().millisecondsSinceEpoch.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "userId": userId,
      "title": title,
      "about_recipe": about_recipe,
      "cooking_method": cooking_method,
      "calorie": calorie,
      "ingredient": ingredient,
      "sub_ingredient": sub_ingredient,
      "time_to_cook": time_to_cook,
      "image": image,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Recipe added to database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateRecipe({
    String docId,
    String userId,
    String title,
    String about_recipe,
    String cooking_method,
    String calorie,
    String ingredient,
    String sub_ingredient,
    String time_to_cook,
    String image,
  }) async {
    DocumentReference documentReference =
    _recipeCollection.doc(userId).collection("recipes").doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "about_recipe": about_recipe,
      "cooking_method": cooking_method,
      "calorie": calorie,
      "ingredient": ingredient,
      "sub_ingredient": sub_ingredient,
      "time_to_cook": time_to_cook,
      "image": image,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Recepi updated int the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readRecipes() {
    String userId;
    CollectionReference collectionReference = _recipeCollection.doc(userId).collection('recipes');
    print(collectionReference);
    return collectionReference.snapshots();
  }

  static Future<void> deleteRecipe({
    String docId,
    String userId,
  }) async {
    DocumentReference documentReference =
    _recipeCollection.doc(userId).collection("recipes").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("Recipe deleted from database"))
        .catchError((e) => print(e));
  }
}