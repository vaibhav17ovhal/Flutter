import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../Controller/all_controllers.dart';
import 'Profile_Page.dart';
import 'mypost_Content.dart';
import 'mytag_content.dart';

class Profile_Page extends StatefulWidget {

  //Profile_Page({super.key});
  var mail;
  // final Map<String, dynamic> userMap;
  // final Function(Map<String, dynamic>) updateUserMap;
  Profile_Page({required this.mail});
  //Profile_Page({required this.userMap, required this.updateUserMap});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  ExampleConroller controller = Get.put(ExampleConroller());
  //late Map<String, dynamic> currentUserMap;
  late Map<String, dynamic> currentUserMap = {};

  @override
  void initState() {
    super.initState();
    //currentUserMap = initializeCurrentUserMap();
    // Fetch user data based on the email
    getUserData(widget.mail);
  }

  void getUserData(String userEmail) {
    // Implement your logic to fetch user data from the database
    // For example, using Firestore
    FirebaseFirestore.instance.collection('Users')
        .where('Email', isEqualTo: userEmail)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          currentUserMap = querySnapshot.docs.first.data() as Map<String, dynamic>;
        });
      } else {
        // Handle the case where no user data is found for the given email
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   print("11111");
  //   // Handle null userMap by providing a default value
  //
  //   currentUserMap = widget.userMap ?? {
  //     "Name": currentUserMap["Name"],
  //     "fileName": currentUserMap["fileName"]
  //   };
  //
  //   print('Current User Map: $currentUserMap');
  //   print("222222");
  // }

  @override
  Widget build(BuildContext context) {
    //String email = widget.mail ?? "No email provided";
    String name = currentUserMap["Name"] ?? "Default Name";
    String fileImage = currentUserMap["fileName"] ?? "default_image_path.jpg";
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    //String name = currentUserMap["Name"] as String? ?? "Default Name";
    //String? fileName = currentUserMap["fileName"] as String? ?? "default_image_path.jpg";

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ABCD",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: w/3),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: IconButton(
                    onPressed: (){
                      // print('Name: $name');
                      // print('File Name: $fileName');
                      // print('Current User Map: $currentUserMap');
                    },
                    icon: Icon(Icons.menu, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              print("Yessssssssssss");
              if (snapshot.hasData && snapshot.data != null) {
                print("okkkkkkk");
                //Map<String, dynamic> userMap = snapshot.data!.docs.data();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(54),
                                    border: GradientBoxBorder(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xff808080),
                                            Color(0xff808080),
                                          ],
                                        ),
                                        width: 3
                                    )
                                ),
                                child:
                                CircleAvatar(
                                    radius: 40,
                                    // backgroundColor: Colors.grey.shade300,
                                    backgroundImage:
                                    NetworkImage(fileImage)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: w / 20
                                ),
                                Column(
                                  children: [
                                    Text("5", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                    Text("Post",
                                      style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(
                                    width: w / 12
                                ),
                                Column(
                                  children: [
                                    Text("244", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                    Text("Followers",
                                      style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(
                                    width: w / 12
                                ),
                                Column(
                                  children: [
                                    Text("234", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                    Text("Following",
                                      style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                SizedBox(
                                    width: w / 20
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text("Hard times breed better mens!",
                        style: TextStyle(color: Colors.white),),
                      Text("🍁❤️", style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: h / 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: h / 25,
                              width: w / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10
                              ),
                              child: Center(child: Text("Edit Profile",
                                style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: h / 25,
                              width: w / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10
                              ),
                              child: Center(child: Text("Share Profile",
                                style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: h / 25,
                                width: w / 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white10
                                ),
                                child: Icon(Icons.person_add_outlined,
                                  color: Colors.white,)),
                          )
                        ],
                      ),
                      Container(
                        height: h / 13,
                        width: w,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text("Story highlights", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                  Icon(Icons.keyboard_arrow_up,
                                    color: Colors.white,)
                                ],
                              ),
                              Text("Keep your favorite stories on your profile",
                                style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: h / 14,
                        width: w,
                        color: Colors.black,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: h / 14,
                                  width: w / 7,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      color: Colors.black
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.add, color: Colors.white,
                                        size: 30),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child:
                                      CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey.shade300,
                                          backgroundImage: controller.imagePath
                                              .isNotEmpty
                                              ? FileImage(File(
                                              controller.imagePath.toString()))
                                              :
                                          null
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 100,
                      ),
                      Container(
                        height: h / 30,
                        color: Colors.black,
                        width: w,
                        child: Text("New Story", style: TextStyle(
                            color: Colors.white)),
                      ),
                      SizedBox(
                        height: h / 100,
                      ),
                      DefaultTabController(
                          initialIndex: 0,
                          length: 2,
                          child: Column(
                            children: [
                              Container(
                                constraints: BoxConstraints.expand(height: 50),
                                child: TabBar(
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorWeight: 2.0,
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Tab(icon: Icon(
                                        Icons.grid_on_sharp,
                                        color: Colors.white,
                                        size: 30),),
                                    Tab(icon: Icon(
                                        Icons.person_pin_outlined,
                                        color: Colors.white,
                                        size: 30),),
                                  ],
                                ),
                              ),
                              Container(
                                height: h,
                                width: w,
                                child: TabBarView(
                                  children: [
                                    MyPostsContent(),
                                    TagsContent(),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),


                );
              }
              else {
                print("Nooooooooo");
                return Text(
                    "No Data avilable", style: TextStyle(color: Colors.white));
              }
            }
          return CircularProgressIndicator(

          )
          ;}),
      ),
    );
  }
}
