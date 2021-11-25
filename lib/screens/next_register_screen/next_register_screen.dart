// import 'package:Foodybite/auth/auth_services.dart';
// import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
// import 'package:Foodybite/screens/post_recipe_screen/models/users.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:provider/provider.dart';
//
// class NextRegisterScreen extends StatefulWidget {
//   @override
//   _PostRecipeState createState() => _PostRecipeState();
// }
//
// class _PostRecipeState extends State<NextRegisterScreen> {
//   File? _imageFile;
//   String uploadedPath = "";
//   late XFile _image;
//   ImagePicker imagePicker = ImagePicker();
//   bool _isLoading = false;
//   final TextEditingController bioController = TextEditingController();
//
//   selectImage() async {
//     await showModalBottomSheet(
//         context: context,
//         builder: (context) => BottomSheet(
//               builder: (context) =>
//                   Column(mainAxisSize: MainAxisSize.min, children: [
//                 ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text("Camera"),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       imagePickerMethod(ImageSource.camera);
//                     }),
//                 ListTile(
//                     leading: Icon(Icons.filter),
//                     title: Text("Gallery"),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       imagePickerMethod(ImageSource.gallery);
//                     })
//               ]),
//               onClosing: () {},
//             ));
//   }
//
//   imagePickerMethod(ImageSource source) async {
//     var pic = await imagePicker.pickImage(source: source);
//     if (pic != null) {
//       setState(() {
//         _image = XFile(pic.path);
//       });
//     }
//     uploadImage(); // image upload function
//   }
//
//   void uploadImage() {
//     String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
//     final Reference storageReference =
//         FirebaseStorage.instance.ref().child('Images').child(imageFileName);
//     final UploadTask uploadTask = storageReference.putFile(File(_image.path));
//     uploadTask.snapshotEvents.listen((event) {
//       setState(() {
//         _isLoading = true;
//       });
//     });
//     uploadTask.then((TaskSnapshot taskSnapshot) async {
//       uploadedPath = await uploadTask.snapshot.ref.getDownloadURL();
//       print(uploadedPath);
//
//       setState(() {
//         _isLoading = false;
//       });
//     }).catchError((error) {});
//   }
//
//   void saveUser() {
//     UserDatabase.addUserIandB(
//       bio: bioController.text,
//     );
//   }
//
//   final userId = FirebaseAuth.instance.currentUser!.uid;
//
//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     return WillPopScope(
//       onWillPop: () async {
//         bool willLeave = false;
//         await showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//                   title: Text('Are you sure?'),
//                   content: Text('Do you really want to exit the app'),
//                   actions: [
//                     new ElevatedButton(
//                       onPressed: () =>
//                           Navigator.of(context).pop(willLeave = true),
//                       child: Text("Yes"),
//                     ),
//                     SizedBox(height: 16),
//                     new FlatButton(
//                       onPressed: () =>
//                           Navigator.of(context).pop(willLeave = false),
//                       child: Text("No"),
//                     ),
//                   ],
//                 ));
//         return willLeave;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.redAccent,
//           title: Text(
//             "Complete Your Profile",
//             style: TextStyle(
//               fontSize: 20,
//               fontFamily: 'MuseoModerno',
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             // ),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () async {
//                   saveUser(userId);
//                     Fluttertoast.showToast(
//                         msg: "User Registered Successfully!!",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.BOTTOM);
//                 },
//                 icon: Icon(Icons.save_rounded),
//                 color: Colors.white)
//           ],
//         ),
//         body: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       end: Alignment.topCenter,
//                       begin: Alignment.bottomCenter,
//                       colors: [
//                     Color.fromRGBO(226, 55, 68, 0.10),
//                     Color.fromRGBO(226, 55, 68, 0.30),
//                     Color.fromRGBO(226, 55, 68, 0.50),
//                     Color.fromRGBO(226, 55, 68, 0.70),
//                   ])),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * .36,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                 child: Column(
//                   children: [
//                     ListView(
//                       shrinkWrap: true,
//                       children: <Widget>[
//                         _imageFile != null
//                             ? Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   ClipRRect(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width -
//                                           20,
//                                       child: Image.file(
//                                         _imageFile!,
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : GestureDetector(
//                                 onTap: () {
//                                   selectImage();
//                                 },
//                                 child: Card(
//                                   elevation: 2,
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     width: MediaQuery.of(context).size.width,
//                                     height:
//                                         MediaQuery.of(context).size.height * .3,
//                                     child: _isLoading == false
//                                         ? Expanded(
//                                             child: uploadedPath == ""
//                                                 ? Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Icon(
//                                                         Icons
//                                                             .cloud_upload_outlined,
//                                                         color: Colors.redAccent,
//                                                         size: 100,
//                                                       ),
//                                                       Padding(
//                                                         padding: EdgeInsets
//                                                             .symmetric(
//                                                                 vertical: 5),
//                                                         child: Text(
//                                                           "Upload Image",
//                                                           style: TextStyle(
//                                                               fontSize: 22),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: EdgeInsets
//                                                             .symmetric(
//                                                                 vertical: 5),
//                                                         child: Text(
//                                                             "click here for upload image"),
//                                                       )
//                                                     ],
//                                                   )
//                                                 : Image(
//                                                     image: NetworkImage(
//                                                         uploadedPath)),
//                                           )
//                                         : CircularProgressIndicator(
//                                             color: Colors.red,
//                                           ),
//                                   ),
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                       Color.fromRGBO(226, 55, 68, 0.10),
//                       Color.fromRGBO(226, 55, 68, 0.30),
//                       Color.fromRGBO(226, 55, 68, 0.50),
//                       Color.fromRGBO(226, 55, 68, 0.70),
//                     ])),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height,
//                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           child: TextField(
//                             keyboardType: TextInputType.multiline,
//                             maxLines: null,
//                             controller: bioController,
//                             decoration: InputDecoration(
//                               labelText: 'Bio',
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
