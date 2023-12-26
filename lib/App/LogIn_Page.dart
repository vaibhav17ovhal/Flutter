import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instagram/App/NaviBar.dart';
import 'package:instagram/App/Sign_Up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final valid = GlobalKey<FormState>();


  RegExp pattern_email = RegExp("^[a-zA-Z0-9]{1,}[@]{1}[a-zA-Z0-9]{1,}[.]{1}[a-zA-Z]{2,3}");
  RegExp pattern_password = RegExp("^[a-zA-Z0-9@#&_+=-]{8,}");

  void login() async{
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();


    _emailController.clear();
    _passwordController.clear();

    if(email == "" || password == ""){
      print("Please fill all the details!");
      final snackBar = SnackBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20)
        // ),
        //animation: CurvedAnimation(curve: Curves.bounceInOut, parent: AnimationMax(ProxyAnimation)),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Warning!',
          message:
          '\nPlease fill all the details!',
          contentType: ContentType.warning,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    else {
      try{
        UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Login Successful!',
              message:
              '\n',
              contentType: ContentType.success,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          Get.to(Navigation());
        }
      }
      on FirebaseAuthException catch(ex){
          print(ex.code.toString());
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Login Failed!',
              message:
              '\nPlease check email and password!',
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: valid,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "Instagram",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: "HeadingFont",
                        letterSpacing: 5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 10, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child: TextFormField(
                      validator: (value) {
                        if (!pattern_email.hasMatch(value!)) {
                          Fluttertoast.showToast(msg: "Invailid Email");
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: "Phone number, username or email address"),
                      controller: _emailController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 15, right: 25, left: 25),
                  child: Container(
                    color: Colors.grey,
                    child:
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.length < 8) {
                      //     return "Wrong password";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      obscureText: passwordObscured,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscured = !passwordObscured;
                                });
                              },
                              icon: Icon(
                                passwordObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              )),
                          border: OutlineInputBorder(),
                          hintText: "Password"),
                      controller: _passwordController,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgotten Password?",
                      style:
                          TextStyle(fontSize: 13, color: Colors.blue.shade600),
                    ),
                    SizedBox(
                      width: w / 30,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Navigation()));
                    if (valid.currentState!.validate()) {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Navigation()),
                      //     (route) => false);
                      login();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        height: h / 15,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.blue.shade900),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: h/20),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("Users").snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.active){
                        print("1111111111");

                          if(snapshot.hasData && snapshot.data != null){
                            return Container(
                              height: h/5,
                              decoration: BoxDecoration(
                                color: Colors.black
                              ),
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                        Map<String, dynamic> userMap = snapshot.data!.docs[index].data();
                                        print("UserMap: ${userMap}.");
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(userMap["fileName"]),
                                          ),
                                          title: Text(userMap["Name"], style: TextStyle(color: Colors.white),),
                                          subtitle: Text(userMap["Email"], style: TextStyle(color: Colors.white),),
                                          trailing: IconButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance.collection("Users").doc(userMap[index]).delete();
                                              },
                                              icon: Icon(Icons.delete, color: Colors.white,)),
                                        );
                                  },),
                            );

                          }
                          else{
                            print("00000000");
                            return Text("No Data avilable", style: TextStyle(color: Colors.white),);
                          }
                      }
                      else{
                        print("******");
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                      }
                    },),
                // SizedBox(height: h/5),
                // Divider(
                //   color: Colors.red,
                //   indent: 20,
                //   endIndent: 250,
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: w/45,
                    ),
                    Container(
                      height: 1,
                      width: w/6,
                      decoration: BoxDecoration(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(
                      width: w/30,
                    ),
                    Center(
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                    SizedBox(
                      width: w/30,
                    ),
                    Container(
                      height: 1,
                      width: w/6,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(
                      width: w/45,
                    ),
                  ],
                ),
                SizedBox(width: w / 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      "Log in with Facebook",
                      style: TextStyle(color: Colors.blue.shade600),
                    ),
                  )
                ]),
                SizedBox(
                  height: h/50,
                ),
                Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: h/50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: w/70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue.shade600),
                    ),
                  )
                ]),
                SizedBox(
                  height: h/30,
                ),
              ]),
        ),
      ),
    );
  }
}
