import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../Controller/all_controllers.dart';

class MediaItem {
  final String assetPath;
  //final String url;
  final MediaType type;

  MediaItem({required this.assetPath, required this.type});
}

enum MediaType {
  image,
  video,
}

class Search_Items extends StatelessWidget {
  ExampleConroller controller = Get.put(ExampleConroller());
  final List<MediaItem> mediaItemss = [
    MediaItem(
        assetPath: "assets/images/Search_02.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/videos/B94BF99C3B50B7A751B4A5FF028F86AD_video_dashinit.mp4",
        type: MediaType.video
    ),
    MediaItem(
        assetPath: "assets/images/Search_03.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_04.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_05.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/videos/364FFC0DA53983A31758B39D70DC03A3_video_dashinit.mp4",
        type: MediaType.video
    ),
    MediaItem(
        assetPath: "assets/images/Search_07.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_08.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_09.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_11.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_12.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/videos/10000000_1597138417697787_5281442233249142028_n.mp4",
        type: MediaType.video
    ),
    MediaItem(
        assetPath: "assets/images/Search_13.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_14.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_15.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/videos/316749152_23951426301170777_1813364856804236736_n.mp4",
        type: MediaType.video
    ),
    MediaItem(
        assetPath: "assets/images/Search_01.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_01.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_01.jpg",
        type: MediaType.image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return
      Scaffold(
        appBar: AppBar(
          title: Container(
            height: h/13,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 10),
                borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              onChanged: (query) {
                controller.search(query);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade600,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            child:
            SizedBox(
              width: w,
              height: h,
              child: GridView.custom(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0.5,
                  crossAxisSpacing: 0.5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ]),
                  // childrenDelegate: SliverChildBuilderDelegate(
                  //       (context, index){
                  //     final mediaItem = mediaItemss[index];
                  //     return Search_Bar(mediaItem: mediaItem);
                  //
                  //   },
                  // )
                childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (index < mediaItemss.length) {
                      final mediaItem = mediaItemss[index];
                      return Search_Bar(mediaItem: mediaItem);
                    } else {
                      return Container(); // Or any other fallback widget
                    }
                  },
                  childCount: mediaItemss.length,
                ),
              ),
            )
        ),
      );
  }
}

class Search_Bar extends StatefulWidget {
  final MediaItem mediaItem;

  Search_Bar({required this.mediaItem});

  @override
  State<Search_Bar> createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    // _controller = VideoPlayerController.asset("assets/images/file_example_MP4_1280_10MG.mp4")..initialize().then((_) {
    //   setState(() {
    //   });
    // });
    super.initState();
    if (widget.mediaItem.type == MediaType.video) {
      _initializeVideoController();
    }
  }

  void _initializeVideoController() {
    _controller = VideoPlayerController.asset(widget.mediaItem.assetPath)
      ..initialize().then((_) {
        print('Video initialized successfully!');
        setState(() {
          // Ensure the first frame is shown after the video is initialized
        });
      }).catchError((error) {
        print('Video initialization error: $error');
      });
    _controller?.addListener(() {
      if (_controller!.value.hasError) {
        print('Video error: ${_controller?.value.errorDescription}');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_controller != null){
        setState(() {
          _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
        });
        }
      },
      child: widget.mediaItem.type == MediaType.video ?
      Stack(
        alignment: Alignment.topRight,
        children: [
          if(_controller != null && _controller!.value.isInitialized)
            VideoPlayer(_controller!),
          if(_controller != null &&
              _controller!.value.isInitialized &&
              !_controller!.value.isPlaying)
            IconButton(
                onPressed: (){
                  setState(() {
                    _controller!.play();
                  });
                },
                icon: Icon(Icons.video_collection_outlined, color: Colors.grey.shade300,size: 20,),
            )
        ],
      ) :
      Image.asset(
        widget.mediaItem.assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
