import 'dart:async';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/App/LogIn_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Controller/all_controllers.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();

}

class _signUpState extends State<signUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  File? fileName;
  final valid_sign = GlobalKey<FormState>();

  ExampleConroller controller = Get.put(ExampleConroller());



  void createAccount() async {
    String name = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String cpassword = _cpasswordController.text.trim();


    if(name == "" || email == "" || password == "" || cpassword == "" || fileName == "") {
      print("Please fill all the details");
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Warning!',
          message:
          '\nPlease fill all the details!',
          contentType: ContentType.warning,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    else if(password != cpassword){
      print("Password do not match");
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Warning!',
          message:
          '\nCheck your password again!',
          contentType: ContentType.warning,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    else{
          UploadTask uploadTask = FirebaseStorage.instance.ref().child("Profile_Pic").child(Uuid().v1()).putFile(fileName!);

           StreamSubscription taskSubscription = uploadTask.snapshotEvents.listen((snapshot) {
            double percentage = snapshot.bytesTransferred/snapshot.totalBytes
                * 100;
            print(percentage.toString());
          });

          TaskSnapshot taskSnapshot =await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          taskSubscription.cancel();

      Map<String, dynamic> userData = {
        "Name" : name,
        "Email" : email,
        "fileName": downloadUrl
      };
      FirebaseFirestore.instance.collection("Users").add(userData);
      print("User Created!");

        try{
          UserCredential Userlogin = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          print("User Created");
          if(Userlogin.user != null){
              Navigator.pop(context);
          }
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Congratulations!',
              message:
              '\nYour account is successfully created!',
              contentType: ContentType.success,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } on FirebaseAuthException catch(ex) {

          if(ex.code == "weak-password") {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Registration Failed!',
                message:
                '\nYour password is weak!',
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
          print(ex.code.toString());
        }
    }
    setState(() {
      fileName = null;
    });
  }

  RegExp pattern_email = RegExp("^[a-zA-Z0-9]{1,}[@]{1}[a-zA-Z0-9]{1,}[.]{1}[a-zA-Z]{2,3}");
  RegExp pattern_password = RegExp("^[a-zA-Z0-9@#&_+=-]{8,}");
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
    _usernameController.dispose();
  }

  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h/10,
                ),
                Text(
                  "Instagram",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: "HeadingFont",
                      letterSpacing: 5),
                ),
                SizedBox(
                  height: h/20,
                ),

                CupertinoButton(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: (fileName != null) ? FileImage(fileName!) : null,
                  ),
                  onPressed: () async {
                    XFile? selectedImage = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Choose Image from"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text("Camera"),
                                onTap: () async {
                                  Navigator.pop(context, await ImagePicker().pickImage(source: ImageSource.camera));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text("Gallery"),
                                onTap: () async {
                                  Navigator.pop(context, await ImagePicker().pickImage(source: ImageSource.gallery));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    if (selectedImage != null) {
                      File convertedFile = File(selectedImage.path);
                      setState(() {
                        fileName = convertedFile;
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 10, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: "Enter your username"),
                      controller: _usernameController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child: TextFormField(
                      validator: (value) {
                        if (!pattern_email.hasMatch(value!)) {
                          Fluttertoast.showToast(msg: "Invailid Email");
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: "Enter email address"),
                      controller: _emailController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child: TextFormField(
                      validator: (value) {
                        if (!pattern_password.hasMatch(value!)) {
                          Fluttertoast.showToast(msg: "Invailid password");
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: "Enter your password"),
                      controller: _passwordController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child: TextFormField(
                      validator: (value) {
                        if (!pattern_password.hasMatch(value!)) {
                          Fluttertoast.showToast(msg: "Invailid password");
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: "Confirm password"),
                      controller: _cpasswordController,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Navigation()),
                    //     (route) => false);
                    createAccount();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        height: h / 15,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.blue.shade900),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already having an account!",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.blue.shade600),
                    ),
                  )
                ])
              ]),
        ),
      ),
    );
  }
}
