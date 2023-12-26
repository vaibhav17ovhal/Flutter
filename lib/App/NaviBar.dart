import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/App/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'New_Post.dart';
import 'Reels/Reels.dart';
import 'profile.dart';
import 'search_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late PageController pageController;
  int _selectedIndex = 0;
  var emailController = TextEditingController();
  String? change_email;

  //late List<Widget> pages;


  @override
  void initState() {
    // TODO: implement initState
    //getdata();
    super.initState();
    pageController = PageController();

  }

  List<Widget> pages =  [
  Home(),
  Search_Items(),
  NewPost(),
  Reels(),
  Profile_Page(mail: "sahil123@gmail.com")
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _selectedIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //iconSize: h/20,
          //elevation: 1,
          selectedFontSize: h/150,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
          BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      color: _selectedIndex == 0 ? Colors.white : Colors.grey.shade700,
                      size: 28,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey.shade700,
                      size: 28,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: _selectedIndex == 2 ? Colors.white : Colors.grey.shade700,
                      size: 28,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.video_collection_outlined,
                      color: _selectedIndex == 3 ? Colors.white : Colors.grey.shade700,
                      size: 28,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/insta_profile.png", scale: 12),
                    label: ''),
          ]),
      body: PageView(
        children: [
          pages[_selectedIndex]
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),

    );
  }
  void getdata() async {
    var prefs = await SharedPreferences.getInstance();
    var getemail = prefs.getString("email");

    change_email = getemail != null ? getemail : "No value Saved";

    print(change_email);

    setState(() {});
  }
}
