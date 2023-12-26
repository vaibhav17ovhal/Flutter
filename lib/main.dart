import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram/App/LogIn_Page.dart';
import 'package:instagram/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'App/NaviBar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  FirebaseFirestore _firestore =  FirebaseFirestore.instance;

  // ##Data Fetching (Specific)##
  // DocumentSnapshot snapshot =  await FirebaseFirestore.instance.collection("Users").doc("Ttzb8SyKiAVmZ3AmpxFO").get();
  //print("000000");
  // print(snapshot.data().toString());

  // =========================================================================

  // ##Data Fetching##
  // QuerySnapshot snapshot =  await FirebaseFirestore.instance.collection("Users").get();
  // for(var doc in snapshot.docs){
  //   print("11111");
  //   print(doc.data().toString());
  // }
  // print("000000");
  // print(doc.data().toString());

  // =========================================================================

  // ##Add Data to DataBase##
  // Map<String, dynamic> newUserData = {
  //   "Name" : "Isha",
  //   "Email" : "Isha000@gmail.com"
  // };
  // await _firestore.collection("Users").add(newUserData);
  // print("New User Saved");

  // =========================================================================

  // ##Set Data to DataBase##
  // Map<String, dynamic> newUserData = {
  //   "Name" : "Isha",
  //   "Email" : "Isha000@gmail.com"
  // };
  // await _firestore.collection("Users").doc("Your_Id").set(newUserData);
  // print("New User Saved");

  // =========================================================================

  // ##Update Data in Database##
  // Map<String, dynamic> newUserData = {
  //   "Name" : "Isha",
  //   "Email" : "Isha000@gmail.com"
  // };
  // await _firestore.collection("Users").doc("Your_Id").update({
  //   "Email" : "Isha111@gmail.com"
  // });
  // print("User Updated");

  // =========================================================================

  // ##Deleting Data from Database##
  // await _firestore.collection("Users").doc("Your_Id").delete();
  // print("Delete User");


  runApp(Main_Class());
}

class Main_Class extends StatefulWidget {
  const Main_Class({super.key});

  @override
  State<Main_Class> createState() => _Main_ClassState();
}

class _Main_ClassState extends State<Main_Class> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        // sliderTheme: SliderThemeData(
        //   activeTrackColor: Colors.blue, // Change the active track color
        //   inactiveTrackColor: Colors.grey, // Change the inactive track color
        //   thumbColor: Colors.blue, // Change the thumb color
        //   overlayColor: Colors.blue.withOpacity(0.3), // Change the overlay color
        // ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            color: Colors.blue, // Change the tab indicator color
          ),
        ),
      ),
      home:
      //LogIn()
      (FirebaseAuth.instance.currentUser != null) ? Navigation() : LogIn(),
    );
  }
}
