// import 'package:Foodybite/screens/post_recipe_screen/button.dart';
// import 'package:Foodybite/screens/post_recipe_screen/model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gradient_text/gradient_text.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class PostRecipeScreen extends StatefulWidget {
//   @override
//   _PostRecipeState createState() => _PostRecipeState();
// }
//
// class _PostRecipeState extends State<PostRecipeScreen> {
//   Food food = Food();
//   File _imageFile;
//   var _category = [
//     'Italian Recipe',
//     'Maxican Recipe',
//     'Chinese Recipe',
//     'Arabian Recipe',
//     'Thai Recipe'
//   ];
//   var _currentItemSelected = 'Italian Recipe';
//
//   Future<void> _pickImage(ImageSource source) async {
//     final selected = await ImagePicker().getImage(source: source);
//     setState(() {
//       _imageFile = File(selected.path);
//     });
//   }
//
//   void _clear() {
//     setState(() {
//       _imageFile = null;
//     });
//   }
//
//   // _save() async {
//   //   uploadFoodAndImages(food, _imageFile, context);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: GradientText(
//       //     'Post Recipe',
//       //     gradient: LinearGradient(
//       //       colors: [
//       //         Color.fromRGBO(255, 138, 110, 1),
//       //         Color.fromRGBO(255, 63, 111, 1),
//       //       ],
//       //       begin: Alignment.centerLeft,
//       //       end: Alignment.centerRight,
//       //     ),
//       //     style: TextStyle(
//       //       color: Colors.black,
//       //       fontSize: 25.0,
//       //       fontWeight: FontWeight.bold,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.white,
//       //   elevation: 0.0,
//       // ),
//       body: Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Post Recipe',
//                   style: TextStyle(
//                     color: Color.fromRGBO(255, 138, 120, 1),
//                       fontSize: 17
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ListView(
//                   shrinkWrap: true,
//                   children: <Widget>[
//                     _imageFile != null
//                         ? Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width - 20,
//                                   child: Image.file(
//                                     _imageFile,
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   FlatButton(
//                                     child: Icon(Icons.refresh),
//                                     onPressed: _clear,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         : GestureDetector(
//                             onTap: () {
//                               _pickImage(ImageSource.gallery);
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: MediaQuery.of(context).size.width,
//                               child: Image.asset(
//                                 'assets/images/upload.png',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                   ],
//                 ),
//                 Container(
//                   child: TextField(
//                     onChanged: (String value) {
//                       food.name = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Title',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     onChanged: (String value) {
//                       food.caption = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'About Recipe',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     onChanged: (String value) {
//                       food.caption = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Cooking Method',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     onChanged: (String value) {
//                       food.caption = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Calories',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     onChanged: (String value) {
//                       food.caption = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Ingredients',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     onChanged: (String value) {
//                       food.caption = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Time Taken',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   // height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: DropdownButton<String>(
//                       items: _category.map((String dropDownStringItem) {
//                         return DropdownMenuItem<String>(
//                           value: dropDownStringItem,
//                           child: Text(dropDownStringItem),
//                         );
//                       }).toList(),
//                       onChanged: (String _newValueSelected) {
//                         setState(() {
//                           _currentItemSelected = _newValueSelected;
//                         });
//                       },
//                       value: _currentItemSelected),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       // _save();
//                     },
//                     child: CustomRaisedButton(
//                       buttonText: 'Post',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:Foodybite/screens/post_recipe_screen/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:Foodybite/models/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:gradient_text/gradient_text.dart';

class PostRecipeScreen extends StatefulWidget {
  @override
  _PostRecipeState createState() => _PostRecipeState();
}

class _PostRecipeState extends State<PostRecipeScreen> {
  Food food = Food();
  File _imageFile;
  var _category = [
    'Italian Recipe',
    'Maxican Recipe',
    'Chinese Recipe',
    'Arabian Recipe',
    'Thai Recipe'
  ];
  var _currentItemSelected = 'Italian Recipe';

  void clearText() {
    titleController.clear();
    aboutController.clear();
    cookingMethodController.clear();
    caloriesController.clear();
    ingredientController.clear();
    subIngregientController.clear();
    timeToCookController.clear();
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  File _image;

  ImagePicker imagePicker = ImagePicker();
  String _imageLink = '';

  imagePickerMethod() async {
    var pic = await imagePicker.pickImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        _image = File(pic.path);
      });
    }
  }

  void uploadImage() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('Images').child(imageFileName);
    final UploadTask uploadTask = storageReference.putFile(_image);

    uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imageUrl) {
        setState(() {
          _imageLink = imageUrl;
        });
        print(_imageLink);
        // RecipeDatabase.addRecipe(
        //     userId: userId, title: titleController.text, about_recipe: aboutController.text, cooking_method: cookingMethodController.text,
        //     calorie: caloriesController.text, ingredient: ingredientController.text, sub_ingredient: subIngregientController.text,
        //     time_to_cook: timeToCookController.text, image: _imageLink
        // );
      });
    }).catchError((error) {});
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController cookingMethodController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController subIngregientController = TextEditingController();
  final TextEditingController timeToCookController = TextEditingController();

  final userId = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
          title: GradientText(
            "Post Recipe",
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'MuseoModerno',
              fontWeight: FontWeight.bold,
            ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                uploadImage();
                // clearText(););
              },
              icon: Icon(Icons.save_rounded),
              color: Colors.white
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(226, 55, 68, 0.10),
                  Color.fromRGBO(226, 55, 68, 0.30),
                  Color.fromRGBO(226, 55, 68, 0.50),
                  Color.fromRGBO(226, 55, 68, 0.70),
                ])),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .36,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _imageFile != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: Image.file(
                                      _imageFile,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Icon(Icons.refresh),
                                      onPressed: _clear,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                imagePickerMethod();
                              },
                              child: Card(
                                elevation: 2,
                                child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_outlined,
                                            color: Colors.redAccent,
                                            size: 100,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              "Upload Image",
                                              style: TextStyle(fontSize: 22),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                                "click here for upload image"),
                                          )
                                        ],
                                      ),
                                    )
                                    // child: Image.asset(
                                    //   'assets/images/upload.png',
                                    //   fit: BoxFit.cover,
                                    // ),
                                    ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(226, 55, 68, 0.10),
                    Color.fromRGBO(226, 55, 68, 0.30),
                    Color.fromRGBO(226, 55, 68, 0.50),
                    Color.fromRGBO(226, 55, 68, 0.70),
                  ])),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextField(
                          // onChanged: (String value) {
                          //   food.name = value;
                          // },
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: aboutController,
                          decoration: InputDecoration(
                            labelText: 'About Recipe',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: cookingMethodController,
                          decoration: InputDecoration(
                            labelText: 'Cooking Method',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: caloriesController,
                          decoration: InputDecoration(
                            labelText: 'Calories',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: ingredientController,
                          decoration: InputDecoration(
                            labelText: 'Ingredients',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: subIngregientController,
                          decoration: InputDecoration(
                            labelText: 'Sub-Ingredients',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // onChanged: (String value) {
                          //   food.caption = value;
                          // },
                          controller: timeToCookController,
                          decoration: InputDecoration(
                            labelText: 'Time to Cook',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
