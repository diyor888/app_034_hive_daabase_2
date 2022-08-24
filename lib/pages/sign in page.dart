import 'package:app_034_hive_daabase_2/database/hive%20sign%20in.dart';
import 'package:app_034_hive_daabase_2/models/sign%20in%20model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignInPage extends StatefulWidget {
  static const String id = "signinpage";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var rejim = true;
  Color oq = Color(0xffffffff);
  Color generalcolor = Color(0xfffff180);
  var inEmail = TextEditingController();
  var inPassword = TextEditingController();

  Color _rang({test}) {
    Color umumiyrang = test ? Color(0xffffa384) : Color(0xff000000);
    return umumiyrang;
  }

  Widget rejim_img({test}) {
    return Image(
      image: rejim
          ? AssetImage("assets/images/img_1.png")
          : AssetImage("assets/images/img.png"),
    );
  }

  _SignIn () {
    String email = inEmail.text.toString().trim();
    String password = inPassword.text.toString().trim();

    var si = new SignIn(email: email,password: password);
    Hive_db_SI().add_si(si);
    SignIn _si = Hive_db_SI().get_obj_si();
    print("email : ${_si.email}");
    print("password : ${_si.password}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: generalcolor,
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  //welcome avatar
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width,
                    color: generalcolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: rejim
                                  ? AssetImage("assets/images/img_1.png")
                                  : AssetImage("assets/images/img.png"),
                              radius: 27,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  rejim = !rejim;
                                  generalcolor = _rang(test: rejim);
                                });
                              },
                              icon: rejim
                                  ? Icon(
                                      Iconsax.sun_15,
                                      color: oq,
                                    )
                                  : Icon(
                                      Iconsax.moon5,
                                      color: oq,
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(color: oq, fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                  ),
                  //email password sign in
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                    height: MediaQuery.of(context).size.height * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //email
                        Text(
                          "Email",
                          style: TextStyle(fontSize: 25),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: generalcolor.withOpacity(0.9),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ]),
                          child: TextField(
                            controller: inEmail,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //password
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 25),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: generalcolor,
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ]),
                          child: TextField(
                            controller: inPassword,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        //
                        Center(
                          child: Text(
                            "Forget password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //sign in button
                        Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            color: generalcolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              _SignIn();
                            },
                            child: Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        //
                        Center(
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.115,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "sdvsdan sda xdfhas df",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: generalcolor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
