import 'package:Foodybite/screens/post_recipe_screen/button.dart';
import 'package:Foodybite/screens/post_recipe_screen/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostRecipeScreen extends StatefulWidget {
  @override
  _PostRecipeState createState() => _PostRecipeState();
}

class _PostRecipeState extends State<PostRecipeScreen> {
  Food food = Food();
  File _imageFile;
  var _category = ['Italian Recipe', 'Maxican Recipe', 'Chinese Recipe', 'Arabian Recipe', 'Thai Recipe'];
  var _currentItemSelected = 'Italian Recipe';

  Future<void> _pickImage(ImageSource source) async {
    final selected = await ImagePicker().getImage(source: source);
    setState(() {
      _imageFile = File(selected.path);
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  // _save() async {
  //   uploadFoodAndImages(food, _imageFile, context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Post Recipe',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 138, 120, 1),
                      fontSize: 17
                  ),
                ),
                SizedBox(height: 10),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    _imageFile != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 20,
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
                              _pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                'assets/images/upload.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ],
                ),
                Container(
                  child: TextField(
                    onChanged: (String value) {
                      food.name = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                      food.caption = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'About Recipe',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                      food.caption = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Cooking Method',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                      food.caption = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Calories',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                      food.caption = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Ingredients',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) {
                      food.caption = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Time Taken',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    items: _category.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String _newValueSelected){
                      setState(() {
                        _currentItemSelected = _newValueSelected;
                      });
                    },
                    value:_currentItemSelected
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // _save();
                    },
                    child: CustomRaisedButton(
                      buttonText: 'Post',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}