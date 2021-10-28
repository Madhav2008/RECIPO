class Recipe {
  final int recipeId;
  final String ytUrl;
  final String name;
  final String photo;
  final String preparationTime;
  final String serves;
  final String complexity;
  final String firstName;
  final String lastName;
  final int inCookingList;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final List<MetaTag> metaTags;

  Recipe(
      {this.recipeId,
        this.ytUrl,
        this.name,
        this.photo,
        this.preparationTime,
        this.serves,
        this.complexity,
        this.firstName,
        this.lastName,
        this.inCookingList,
        this.ingredients,
        this.instructions,
        this.metaTags});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipeId'],
      ytUrl: json['ytUrl'],
      name: json['name'],
      photo: json['photo'],
      preparationTime: json['preparationTime'],
      serves: json['serves'],
      complexity: json['complexity'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      inCookingList: json['inCookingList'],
      ingredients: json['ingredients'] == null
          ? []
          : Ingredients.fromJson(json['ingredients']).ingredients,
      instructions: json['instructions'] == null
          ? []
          : Instructions.fromJson(json['instructions']).instructions,
      metaTags: json['metaTags'] == null
          ? []
          : MetaTags.fromJson(json['metaTags']).metaTags,
    );
  }
}

class Ingredient {
  final int id;
  final String value;

  Ingredient({this.id, this.value});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(id: json['id'], value: json['ingredient']);
  }
}

class Ingredients {
  final List<Ingredient> ingredients;

  Ingredients({this.ingredients});

  factory Ingredients.fromJson(List<dynamic> parsedJson) {
    List<Ingredient> ingredients = new List<Ingredient>();
    ingredients = parsedJson.isEmpty
        ? []
        : parsedJson.map((i) => Ingredient.fromJson(i)).toList();
    return new Ingredients(
      ingredients: ingredients,
    );
  }
}

class Instruction {
  final int id;
  final String instruction;

  Instruction({this.id, this.instruction});

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(id: json['id'], instruction: json['instruction']);
  }
}

class Instructions {
  final List<Instruction> instructions;

  Instructions({this.instructions});

  factory Instructions.fromJson(List<dynamic> parsedJson) {
    List<Instruction> instructions = new List<Instruction>();
    instructions = parsedJson.isEmpty
        ? []
        : parsedJson.map((i) => Instruction.fromJson(i)).toList();
    return new Instructions(
      instructions: instructions,
    );
  }
}

class MetaTag {
  final int id;
  final String tag;

  MetaTag({this.id, this.tag});

  factory MetaTag.fromJson(Map<String, dynamic> json) {
    return MetaTag(id: json['id'], tag: json['tag']);
  }
}

class MetaTags {
  final List<MetaTag> metaTags;

  MetaTags({this.metaTags});

  factory MetaTags.fromJson(List<dynamic> parsedJson) {
    List<MetaTag> metaTags = new List<MetaTag>();
    metaTags = parsedJson.isEmpty
        ? []
        : parsedJson.map((i) => MetaTag.fromJson(i)).toList();
    return new MetaTags(
      metaTags: metaTags,
    );
  }
}