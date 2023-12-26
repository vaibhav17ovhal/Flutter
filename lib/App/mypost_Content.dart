import 'package:flutter/material.dart';

class MyPostsContent extends StatelessWidget {

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
    return GridView.builder(
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
    )
  ;}
}