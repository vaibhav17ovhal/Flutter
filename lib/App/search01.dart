import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MediaItem {
  //final String assetPath;
  final String url;
  final MediaType type;

  MediaItem({required this.url, required this.type});
}

enum MediaType {
  image,
  video,
}

class Trr extends StatelessWidget {
  final List<MediaItem> mediaItems = [
    MediaItem(
      //assetPath: "assets/images/30 Second Explainer Videos.mp4",
      url: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      type: MediaType.video,
    ),
    MediaItem(
      //assetPath: "assets/images/emran_dp.png",
      url: "https://e0.pxfuel.com/wallpapers/116/2/desktop-wallpaper-love-birds-beautiful-nature-background.jpg",
      type: MediaType.image,
    ),
    MediaItem(
      //assetPath: "assets/images/Hasina Pagal Deewani_ Indoo Ki Jawani (Full Song) Kiara Advani, Aditya S _ Mika S,Asees K,Shabbir A.mp4",
      url: 'https://youtu.be/VAdGW7QDJiU?si=qJ6iec8qRnTVBC15',
      type: MediaType.video,
    ),
    MediaItem(
      //assetPath: "assets/images/emran_dp.png",
      url: 'https://e0.pxfuel.com/wallpapers/116/2/desktop-wallpaper-love-birds-beautiful-nature-background.jpg',
      type: MediaType.image,
    ),
    MediaItem(
      //assetPath: "assets/images/Hasina Pagal Deewani_ Indoo Ki Jawani (Full Song) Kiara Advani, Aditya S _ Mika S,Asees K,Shabbir A.mp4",
      url: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4',
      type: MediaType.video,
    ),
    MediaItem(
      //assetPath: "assets/images/emran_dp.png",
      url: 'https://e0.pxfuel.com/wallpapers/116/2/desktop-wallpaper-love-birds-beautiful-nature-background.jpg',
      type: MediaType.image,
    ),
    MediaItem(
      //assetPath: "assets/images/Hasina Pagal Deewani_ Indoo Ki Jawani (Full Song) Kiara Advani, Aditya S _ Mika S,Asees K,Shabbir A.mp4",
      url: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      type: MediaType.video,
    ),
    MediaItem(
      //assetPath: "assets/images/emran_dp.png",
      url: 'https://e0.pxfuel.com/wallpapers/116/2/desktop-wallpaper-love-birds-beautiful-nature-background.jpg',
      type: MediaType.image,
    ),
    MediaItem(
      //assetPath: "assets/images/Hasina Pagal Deewani_ Indoo Ki Jawani (Full Song) Kiara Advani, Aditya S _ Mika S,Asees K,Shabbir A.mp4",
      url: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
      type: MediaType.video,
    ),
    MediaItem(
      //assetPath: "assets/images/emran_dp.png",
      url: 'https://e0.pxfuel.com/wallpapers/116/2/desktop-wallpaper-love-birds-beautiful-nature-background.jpg',
      type: MediaType.image,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Media Grid Example'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: mediaItems.length,
          itemBuilder: (context, index) {
            final mediaItem = mediaItems[index];
            return MediaItemWidget(mediaItem: mediaItem);
          },
        ),
      ),
    );
  }
}

class MediaItemWidget extends StatefulWidget {
  final MediaItem mediaItem;

  MediaItemWidget({required this.mediaItem});

  @override
  _MediaItemWidgetState createState() => _MediaItemWidgetState();
}

class _MediaItemWidgetState extends State<MediaItemWidget> {
  late VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();

    if (widget.mediaItem.type == MediaType.video) {
      _initializeVideoController();
    }
  }

  void _initializeVideoController() {
    _videoController = VideoPlayerController.network(widget.mediaItem.url)
      ..initialize().then((_) {
        setState(() {
          // Ensure the first frame is shown after the video is initialized
        });
      }).catchError((er){
      print('Video initialization error: $er');
    });
    _videoController?.addListener(() {
      if (_videoController!.value.hasError) {
        print('Video error: ${_videoController?.value.errorDescription}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_videoController != null) {
          if (_videoController!.value.isPlaying) {
            _videoController!.pause();
          } else {
            _videoController!.play();
          }
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.mediaItem.type == MediaType.image)
            CachedNetworkImage(
              imageUrl: widget.mediaItem.url,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error){
                print('Image loading error: $error');
                return Icon(Icons.error);},
            ),
          if (widget.mediaItem.type == MediaType.video)
            VideoPlayer(_videoController!),
          if (widget.mediaItem.type == MediaType.video && !_videoController!.value.isPlaying)
            Container()
        ],
      ),
    );
  }
  // Widget build(BuildContext context){
  //   return GestureDetector(
  //     onTap: (){
  //       setState(() {
  //         _videoController!.value.isPlaying ? _videoController!.pause() : _videoController!.play();
  //       });
  //     },
  //     child:
  //     Container(
  //       width: 300,
  //       height: 200,
  //       decoration: BoxDecoration(color: Colors.red),
  //       child: _videoController!.value.isInitialized ?
  //             VideoPlayer(_videoController!):
  //             Container(),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
}
