import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/all_controllers.dart';

class Option_Screen extends StatelessWidget {

  const Option_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ExampleConroller controller = Get.put(ExampleConroller());
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: h/1.7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h/6,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 18,),
                        radius: 16,
                      ),
                      SizedBox(
                        width: w/30,
                      ),
                      Text("ASDFGHJ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(
                        width: w/70,
                      ),
                      Icon(Icons.verified, size: 20,),
                      TextButton(
                          onPressed: (){},
                          child: Text("Follow", style: TextStyle(
                            color: Colors.white
                          ),))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("This is soo beautiful ❤️❤️"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.music_note_outlined, size: 18,),
                    Text("Original Audio - some music track --")
                        ],
                      ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: h/30,
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_outline,size: 30,)),
                  Text("616K"),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.comment_rounded,size: 30,)),
                  Text("100"),
                  IconButton(
                      onPressed: (){},
                      icon: Transform(
                        transform: Matrix4.rotationZ(5.8),
                          child: Icon(Icons.send,size: 30,))),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert,size: 30,)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
