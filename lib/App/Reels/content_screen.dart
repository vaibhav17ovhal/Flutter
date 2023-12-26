import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/App/Reels/option_screen.dart';
import 'package:video_player/video_player.dart';

import 'like_icon.dart';

class Content_Screen extends StatefulWidget {
  final String? src;



  Content_Screen({super.key, this.src});

  @override
  State<Content_Screen> createState() => _Content_ScreenState();
}

class _Content_ScreenState extends State<Content_Screen> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController!.initialize()]);
    _chewieController = ChewieController(videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      showControls: false,
      looping: true,
      //fullScreenByDefault: true
    );
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //Image.network(widget.src!, fit: BoxFit.cover,),
        _chewieController != null && _chewieController!.videoPlayerController!.value.isInitialized ? GestureDetector(
          onDoubleTap: (){
            setState(() {
              _liked = !_liked;
            });
          },
            child: Chewie(controller: _chewieController!)) :
        Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10,),
            Text("Loading...")
          ],
        ),
        if(_liked)
          Center(
            child: LikeIcon(),
          ),
        Option_Screen()
      ],
    );
  }
}
