import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/App/search_bar.dart';
import 'package:video_player/video_player.dart';



class ExampleConroller extends GetxController{

  RxList<Image> PP = [
    Image.asset("assets/images/Screenshot__12_-removebg-preview.png"),
    Image.asset("assets/images/disha_dp.png"),
    Image.asset("assets/images/love_quotes_dp.png"),
    Image.asset("assets/images/nidz_dp.png"),
    Image.asset("assets/images/virat_dp.png"),
    Image.asset("assets/images/kiara_dp.png"),
    Image.asset("assets/images/AB_dp.png"),
    Image.asset("assets/images/disha_dp.png"),
    Image.asset("assets/images/emran_dp.png"),
    Image.asset("assets/images/nidz_dp.png")
  ].obs;

  RxList<String> namee = [
    "assets/images/photo1-modified.png",
    "assets/images/photo3-modified.png",
    "assets/images/photo5-modified.png",
    "assets/images/photo7-modified.png",
    "assets/images/photo2-modified.png",
    "assets/images/photo4-modified.png",
    "assets/images/photo6-modified.png",
    // Image.asset("assets/images/insta_profile_02.png", fit: BoxFit.cover),
    // Image.asset("assets/images/insta_profile_03.png", fit: BoxFit.cover),
    // Image.asset("assets/images/insta_profile.png", fit: BoxFit.cover),
    // Image.asset("assets/images/insta_profile.png", fit: BoxFit.cover),
  ].obs;

  RxList<List> allPost = [
    [
      "assets/images/bella_post.png",
      "assets/images/bella_post02.png",
      "assets/images/bella_post03.png"
    ],
    [
      "assets/images/disha01 (2).png",
      "assets/images/disha_02.png",
      "assets/images/disha_03.png"
    ],
    [
      "assets/images/post_03.png",
      "assets/images/love02 (1).png",
      "assets/images/love02 (2).png"
    ],
    [
      "assets/images/nidz_01.png",
      "assets/images/nidz03 (1).png",
      "assets/images/nidz03 (2).png"
    ],
    [
      "assets/images/virat_01.png"
    ],
    [
      "assets/images/kiara_01.png"
    ],
    [
      "assets/images/AB_01.png"
    ],
    [
      "assets/images/disha01 (2).png",
          "assets/images/disha_02.png",
      "assets/images/disha_03.png"
    ],
    [
      "assets/images/emran_01.png"
    ],
    [
      "assets/images/nidz_02.png",
          "assets/images/nidz03 (1).png",
      "assets/images/nidz03 (2).png"
    ],
    // "Mens Wear",
    // "Kids Wear",
    // "Womens Wear",
    // "Formals",
    // "Accesories",
    // "Electronics",
  ].obs;

  RxList<Image> Search_Post = [
    Image.asset(
      "assets/images/Search_01.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_02.jpg",
      fit: BoxFit.cover,
    ),

    Image.asset(
      "assets/images/Search_03.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_04.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_05.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_06.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_07.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_08.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_09.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_10.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_11.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_12.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_13.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_14.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_15.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/Search_16.jpg",
      fit: BoxFit.cover,
    ),
  ].obs;

  // RxList<VideoItem> videos = [
  //   VideoItem('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4'),
  //   VideoItem('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4'),
  //   VideoItem('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4'),
  // ].obs;

  RxList<MediaItem> mediaItemss = [
    MediaItem(
        assetPath: "assets/images/Search_02.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "",
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
        assetPath: "assets/images/Search_06.jpg",
        type: MediaType.image
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
        assetPath: "assets/images/Search_10.jpg",
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
        assetPath: "assets/images/Search_16.jpg",
        type: MediaType.image
    ),
    MediaItem(
        assetPath: "assets/images/Search_01.jpg",
        type: MediaType.image
    ),
  ].obs;

  RxList<String> one = [
    "http://wallpapercave.com/wp/wp3246755.jpg",
    "http://wallpapercave.com/wp/wp3246756.jpg",
    "http://wallpapercave.com/wp/wp3246757.jpg",
    "http://wallpapercave.com/wp/wp3246758.jpg",
    "http://wallpapercave.com/wp/wp3246759.jpg"
  ].obs;
  RxList two = [].obs;

  addtofav(String value){
    two.add(value);
  }

  removefav(String value){
    two.remove(value);
  }

  // RxString imagePath = ''.obs;
  //
  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.camera);
  //   if(image != null){
  //     imagePath.value = image.path.toString();
  //   }
  // }

  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    // Show a dialog with options to pick from camera or gallery
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Image from"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  await pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  await pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }


  // RxList<Image> allPost = [
  //   Image.asset("assets/images/bella_post.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/disha_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/post_03.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/nidz_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/virat_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/kiara_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/AB_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/disha_02.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/emran_01.png", fit: BoxFit.cover),
  //   Image.asset("assets/images/nidz_02.png", fit: BoxFit.cover)
  // ].obs;

  // RxString imagePath = ''.obs;
  //
  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.camera);
  //   if(image != null){
  //     imagePath.value = image.path.toString();
  //   }
  // }

  RxList UserName = [
    "bellavita.official",
    "dishapatani",
    "love.quotes",
    "nidz_20",
    "virat.kohli",
    "kiaraaliaadvani",
    "abdevilliers17",
    "dishapatani",
    "therealemraan",
    "nidz_20"
  ].obs;

  RxList like = [].obs;

  on(String value){
    like.add(value);
  }

  off(String value){
    like.remove(value);
  }

  RxList save = [].obs;

  onsave(String value){
    save.add(value);
  }

  offsave(String value){
    save.remove(value);
  }

  RxList<String> searchResults = <String>[].obs;

  List<String> data = [
    'John Doe',
    'Jane Doe',
    'Alice Smith',
    'Bob Johnson',
    'Charlie Brown',
    'David Jones',
    'Emma Watson',
    'Frank Miller',
    'Grace Kelly',
    'Henry Ford',
  ];

  void search(String query) {
    searchResults.assignAll(data.where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }

}