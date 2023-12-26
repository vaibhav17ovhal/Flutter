import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'NaviBar.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final TextEditingController caption = TextEditingController();
  File? imageFile;

  String url = "";
  ImagePicker image = ImagePicker();
  File? file;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: (){
              Get.to(Navigation());
          },
        ),
        title: Text("New Post", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
            child: Text("Post", style: TextStyle(fontSize: 18,color: Colors.blue)),
            onPressed: (){},
            )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: h/40,
            ),
            qwe != null
                ?
                Image(image: FileImage(qwe!), width: w)
                : Image.asset(
              "assets/images/default-image.jpg",
                width: w,
            ),
            SizedBox(
              height: h / 60,
            ),
            ElevatedButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses =
                  await [Permission.storage, Permission.camera].request();
                  if (statuses[Permission.storage]!.isGranted &&
                      statuses[Permission.camera]!.isGranted) {
                    showImagePicker(context);
                  } else if (statuses[Permission.storage]!
                      .isPermanentlyDenied ||
                      statuses[Permission.camera]!.isPermanentlyDenied) {
                    // Provide a way for the user to open app settings and grant permissions manually.
                    openAppSettings();
                  } else {
                    print("No Permission provided");
                  }
                },
                child: Text("Select Image")),
            // ElevatedButton(
            //     onPressed: () async {
            //       XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
            //       if(selectedImage != null) {
            //         File convertedFile = File(selectedImage.path);
            //         setState(() {
            //           imageFile  = convertedFile;
            //         });
            //         print("Image Selected!");
            //       }
            //       else {
            //         print("No Permission provided");
            //       }
            //     },
            //     child: Text("Select Image")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: caption,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  hintText: "Write a caption...",
                  border: InputBorder.none
                ),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            SizedBox(
              height: h/50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.white, size: 28,),
                          SizedBox(
                            width: w/30,
                          ),
                          Text("Add location", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: h/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_outline_sharp, color: Colors.white, size: 28,),
                          SizedBox(
                            width: w/30,
                          ),
                          Text("Tag people", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: h/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 28,),
                          SizedBox(
                            width: w/30,
                          ),
                          Text("Audience", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: h/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.music_note_outlined, color: Colors.white, size: 28,),
                          SizedBox(
                            width: w/30,
                          ),
                          Text("Add music", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: h/40,
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                  ),
                  SizedBox(
                    height: h/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.facebook, color: Colors.white, size: 28,),
                          SizedBox(
                            width: w/30,
                          ),
                          Text("Share to Facebook", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final picker = ImagePicker();
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.photo,
                                size: 50,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Gallery"),
                            ],
                          ),
                          onTap: () {
                            gall();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 50,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Camera"),
                            ],
                          ),
                          onTap: () {
                            cam();
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  File? qwe;
  Future gall() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    print('$imageTemporary');
    setState(() {
      qwe = imageTemporary;
    });
  }

  Future cam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    print('$imageTemporary');
    setState(() {
      qwe = imageTemporary;
    });
  }
}
