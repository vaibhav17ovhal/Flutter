import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controllers.dart';



List<Image> Logo = [
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png"),
  Image.asset("assets/images/bella_vita_icon.png")
];

List<Image> ex = [
  Image.asset("assets/images/bella_post.png", fit: BoxFit.cover),
  Image.asset("assets/images/disha_01.png", fit: BoxFit.cover),
];

class Let extends StatefulWidget {
  const Let({super.key});

  @override
  State<Let> createState() => _LetState();
}

class _LetState extends State<Let> {
  ExampleConroller controller = Get.put(ExampleConroller());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Like"),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: ex.length,
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return Container(
                      child: Center(
                          child: ex[index],
                          ),
                    );
                  },
                )
                // CarouselSlider(
                //   items: ex.map((index) => Container(
                //     width: w,
                //     child: Center(
                //       child: index,
                //     ),
                //   )).toList(),
                //   options: CarouselOptions(
                //     autoPlay: false,
                //     aspectRatio: 0.95,
                //     height: h,
                //     enableInfiniteScroll: true,
                //
                //     //enlargeCenterPage: true,
                //   ),
                // )
              ],
            ),
          ),
        ),

    );
  }
}
