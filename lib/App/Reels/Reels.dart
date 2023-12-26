import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/App/Reels/content_screen.dart';

class Reels extends StatefulWidget {



  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {

  final List<String> video = [
    "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
    "http://www.exit109.com/~dnn/clips/RW20seconds_2.mp4",
    "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
    "http://www.exit109.com/~dnn/clips/RW20seconds_2.mp4",
    "http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: h,
                  child: Swiper(
                      itemCount: video.length,
                      itemBuilder: (context, index) {
                        return
                          Content_Screen(src: video[index],)
                      ;},
                    scrollDirection: Axis.vertical,
                  ),
                ),
                //Content_Screen(),
                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Text("jbsdksdjbk"),
                //       // Icon(Icons.camera)
                //     ],
                //   ),
                // )
              ],
            )
        ),
      ),
    );
  }
}
