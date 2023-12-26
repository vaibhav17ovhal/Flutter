import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../Controller/all_controllers.dart';
import 'profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ExampleConroller controller = Get.put(ExampleConroller());
  final List<Image> myPost = [
    Image.asset(
      "assets/images/my_post_01.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/my_post_02.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/my_post_03.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/my_post_04.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/my_post_05.jpg",
      fit: BoxFit.cover,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "vaibhav_ovhal_07",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                      //Get.to(Profile_Page());
                    },
                      icon: Icon(Icons.menu, color: Colors.white)),
                ),
              ],
            ),
          ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h/11,
                width: w,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/insta_profile_03.png",
                        scale: 2,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            height: h/10,
                            width: w/7,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text("5",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                      color: Colors.white, letterSpacing: 1.5),
                                )
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: h/10,
                          width: w/5,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "244",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.5),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: h/10,
                          width: w/5,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "234",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.5),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 70,
                width: w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(
                        "Vaibhav Ovhal",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(
                        "Hard times breed better mens!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 2),
                      child: Icon(Icons.filter_vintage_rounded,
                          color: Colors.yellow),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                width: w,
                height: 50,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Container(
                          height: 30,
                          width: 170,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 50),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 30,
                          width: 170,
                          // color: Colors.grey.shade800,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 40),
                            child: Text(
                              "Share Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(7)),
                          child: Icon(Icons.person_add_outlined,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: h/13,
                width: w,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Story highlights", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                          Icon(Icons.keyboard_arrow_up,color: Colors.white,)
                        ],
                      ),
                      Text("Keep your favorite stories on your profile", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Container(
                height: h/14,
                width: w,
                color: Colors.black,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: h/14,
                          width: w/7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                              color: Colors.black
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Icon(Icons.add, color: Colors.white,size: 30),
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
                                  backgroundImage: controller.imagePath.isNotEmpty ? FileImage(File(controller.imagePath.toString())):
                                  null
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(
                              //       Icons.circle,
                              //       color: Colors.grey.shade500,
                              //       size: 60,
                              //     )),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h/100,
              ),
              Container(
                height: h/30,
                color: Colors.black,
                width: w,
                child: Text("New Story", style: TextStyle(color: Colors.white)),
              ),
              Container(
                height: 50,
                width: w,
                color: Colors.black,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170),
                      child: Icon(
                        Icons.person_pin_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: myPost[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
