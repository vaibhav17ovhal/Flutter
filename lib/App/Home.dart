import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/App/Comments.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:instagram/App/mm.dart';
import 'package:instagram/Controller/all_controllers.dart';

import 'LogIn_Page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex01 = 0;
  int _currentIndex02 = 0;
  int _currentIndex03 = 0;

  void logOut() async {
    await FirebaseAuth.instance.signOut();
      //Get.to(LogIn());
     Navigator.popUntil(context as BuildContext, (route) => route.isFirst);
     Navigator.pushReplacement(context as BuildContext, CupertinoPageRoute(builder: (context) => LogIn()));
  }

  ExampleConroller controller = Get.put(ExampleConroller());



  final List name = [

    Image.asset("assets/images/insta_profile_02.png", fit: BoxFit.cover),
    Image.asset("assets/images/insta_profile_03.png", fit: BoxFit.cover),
    Image.asset("assets/images/insta_profile.png", fit: BoxFit.cover),
    Image.asset("assets/images/insta_profile.png", fit: BoxFit.cover),
    Image.asset("assets/images/insta_profile_02.png", fit: BoxFit.cover),
  ];
  
  bool like_button = true;
  bool bookmark = true;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "Instagram",
            style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "HeadingFont",
                letterSpacing: 4,
                fontSize: 22),
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: (){
                Get.to(mapp());
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            width: w/70,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                logOut();
              },
              icon: Icon(
                Icons.messenger_outline_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
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
                height: h/8,
                width: w,
                color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.namee.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10, right: 5),
                          child:
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(54),
                                border: GradientBoxBorder(gradient: LinearGradient(
                                  colors: [
                                    Color(0xffF9CE34),
                                    Color(0xffEE2A7B),
                                    Color(0xff6228d7),
                                  ],
                                ),
                                    width: 4
                                )

                            ),
                            child: Obx( ()=>
                              CircleAvatar(
                                  radius: 37,
                                  // backgroundColor: Colors.grey.shade300,
                                  backgroundImage:
                                  AssetImage(controller.namee[index])
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),

              Obx(()=>
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.allPost.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: h/17,
                            width: w,
                            color: Colors.black,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: w/40,
                                ),
                            Obx(()=>
                              Container(
                                height: h/20,
                                width: w/9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:
                                  controller.PP[index],
                          ),
                            ),
                                SizedBox(
                                  width: w/30,
                                ),
                                Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: w / 1.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2, top: 3),
                                            child: Row(
                                              children: [
                                                Text(
                                                  controller.UserName[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                SizedBox(
                                                  width: w/50,
                                                ),
                                                Icon(Icons.verified,
                                                    color: Colors.blue, size: 18),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 50),
                                            child: Text(
                                              "Sponsored",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: w/20,
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
                                              context: context,
                                              builder: (context) => Container(
                                                width: w,
                                                decoration: BoxDecoration(color: Colors.white,
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
                                                //  height: h / 2,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: h/8,
                                                      width: w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                      ),
                                                      child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 80),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  height: h/12,
                                                                  width: w/7,
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    border: Border.all(color: Colors.black),
                                                                    color: Colors.white
                                                                  ),
                                                                  child: InkWell(
                                                                    onTap: (){},
                                                                    child: Icon(Icons.bookmark_border, color: Colors.black,size: 30),
                                                                  ),
                                                                ),
                                                                Text("Save", style: TextStyle(color: Colors.black))
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 80),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  height: h/12,
                                                                  width: w/7,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      border: Border.all(color: Colors.black),
                                                                      color: Colors.white
                                                                  ),
                                                                  child: InkWell(
                                                                    onTap: (){},
                                                                    child: Icon(Icons.qr_code_scanner_rounded, color: Colors.black,size: 30,),
                                                                  ),
                                                                ),
                                                                Text("QR code", style: TextStyle(color: Colors.black))
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: h/50,
                                                      thickness: 1,
                                                      endIndent: 20,
                                                      indent: 20,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.star_border,color: Colors.black, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("Add to favorites", style: TextStyle(color: Colors.black, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/18,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.person_remove_alt_1_outlined,color: Colors.black, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("Unfollow", style: TextStyle(color: Colors.black, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: h/50,
                                                      thickness: 1,
                                                      endIndent: 20,
                                                      indent: 20,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.info_outline_rounded,color: Colors.black, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("Why you're seeing this post", style: TextStyle(color: Colors.black, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.visibility_off_outlined,color: Colors.black, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("Hide", style: TextStyle(color: Colors.black, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.person_pin,color: Colors.black, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("About this account", style: TextStyle(color: Colors.black, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){},
                                                      child: Container(
                                                        height: h/15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 20),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.report_gmailerrorred,color: Colors.red, size: 30 ,),
                                                              SizedBox(
                                                                width: w/40,
                                                              ),
                                                              Text("Report", style: TextStyle(color: Colors.red, fontSize: 17))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        },
                                        icon: Icon(
                                          Icons.more_vert_outlined,
                                          color: Colors.white,
                                          size: 25,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: h/2,
                            width: w,
                            decoration: BoxDecoration(
                              //color: Colors.red
                            ),
                            child: Container(
                              //width: double.infinity,
                              child: CarouselSlider.builder(

                                itemBuilder: (context, inn, realIndex) {
                                  return
                                    Image.asset(
                                      controller.allPost[index][inn],
                                      width: w,
                                      //height: 100,
                                      //"assets/images/disha_01.png",
                                      //Image.asset("assets/images/kiara_01.png");
                                      fit: BoxFit.cover,
                                    )
                                  ;
                                },
                                itemCount: controller.allPost[index].length,
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  aspectRatio: 0.96,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex01 = index;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   child: CarouselSlider.builder(
                          //   itemCount: 3,
                          //   itemBuilder: (context, inn, realIndex) {
                          //     return
                          //       Image.asset(
                          //           //controller.allPost[index][inn],
                          //         "assets/images/disha_01.png",
                          //           //scale: 2,
                          //       fit: BoxFit.fill,
                          //       //Image.asset("assets/images/kiara_01.png");
                          //       //fit: BoxFit.fill,
                          //     )
                          //     ;
                          //   },
                          //   options: CarouselOptions(
                          //     viewportFraction: 1.0,
                          //     autoPlay: false,
                          //     enlargeCenterPage: true,
                          //     //aspectRatio: 1.8,
                          //     onPageChanged: (index, reason) {
                          //       setState(() {
                          //         _currentIndex01 = index;
                          //       });
                          //     },
                          //   ),
                          //                             ),
                          // ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  color: Colors.black,
                                  height: h/25,
                                  width: w,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15, top: 3),
                                            child:
                                            Obx(()=>
                                              IconButton(
                                                  onPressed: (){
                                                    if(controller.like.contains(controller.allPost[index].toString())){
                                                      controller.off(controller.allPost[index].toString());
                                                      print("${controller.allPost[index]} Yesss");

                                                    }
                                                    else{
                                                      controller.on(controller.allPost[index].toString());
                                                      print("${controller.allPost[index]} Noooo");
                                                    }
                                                  },
                                                  icon: controller.like.contains(controller.allPost[index].toString()) ? Icon(
                                                      Icons.favorite, color: Colors.red, size: 30,
                                                  ):
                                                  Icon(
                                                      Icons.favorite_border, color: Colors.white,size: 30,
                                                  )
                                              ),
                                            )
                                          ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10, top: 12),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Comments()));
                                            },
                                            child: Icon(
                                              Icons.mode_comment_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20, top: 12),
                                          child: Icon(
                                            Icons.send_rounded,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 210, top: 5),
                                            child: Obx(()=>
                                              IconButton(
                                                onPressed: () {
                                                  if(controller.save.contains(controller.allPost[index].toString())){
                                                    controller.offsave(controller.allPost[index].toString());
                                                    print("${controller.allPost[index]} Yesss");

                                                  }
                                                  else{
                                                    controller.onsave(controller.allPost[index].toString());
                                                    print("${controller.allPost[index]} Noooo");
                                                  }
                                                },
                                                icon: controller.save.contains(controller.allPost[index].toString()) ? Icon(
                                                  Icons.bookmark, color: Colors.white, size: 30,
                                                ):
                                                Icon(
                                                  Icons.bookmark_border_outlined, color: Colors.white,size: 30,
                                                )
                                              ),
                                            )
                                        )
                                      ])),
                                SizedBox(
                                height: h/70,
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 27),
                                  child: Text(
                                  "789 Likes",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                                      ),
                                ),
                              SizedBox(
                                height: h/100,
                              ),

                            ],
                          ),


                          // Container(
                          //   width: w,
                          //   height: h/30,
                          //   color: Colors.red,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 30),
                          //     child: Text(
                          //       "789 Likes",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NaviBar,
    );
  }
}
