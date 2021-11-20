import 'dart:io';
import 'package:Foodybite/screens/post_recipe_screen/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController _editBioController = TextEditingController();
TextEditingController _editDisplayNameController = TextEditingController();
TextEditingController _editEmailController = TextEditingController();
TextEditingController _editPasswordController = TextEditingController();

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File _profileImageFile;

  Future<void> _pickImage() async {
    final selected = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _profileImageFile = File(selected.path);
    });
  }

  void _clear() {
    setState(() {
      _profileImageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Edit'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _profileImageFile != null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: FileImage(_profileImageFile),
                    radius: 60,
                  ),
                  FlatButton(
                    child: Icon(Icons.refresh),
                    onPressed: _clear,
                  ),
                ],
              )
                  : GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        width: 100,
                        child: Icon(
                          Icons.person,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Select Profile Image',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  autovalidate: true,
                  controller: _editDisplayNameController
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Bio',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _editBioController
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    autovalidate: true,
                    controller: _editEmailController
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    autovalidate: true,
                    obscureText: true,
                    controller: _editPasswordController
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: CustomRaisedButton(buttonText: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}