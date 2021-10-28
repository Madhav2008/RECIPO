import 'package:Foodybite/screens/home_screen/recipe.dart';

class RecipeList {
  final List<Recipe> recipeList;

  RecipeList({this.recipeList});

  factory RecipeList.fromJson(List<dynamic> parsedJson) {
    List<Recipe> recipeList = new List<Recipe>();
    recipeList = parsedJson.map((i) => Recipe.fromJson(i)).toList();
    return new RecipeList(
      recipeList: recipeList,
    );
  }
}