import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> homeKey = GlobalKey<FormState>();
  Future getData() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var emailVal = prefer.getString('email');
    var passwordVal = prefer.getString('password');
    setState(() {
      Global.email = emailVal;
      Global.password = passwordVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueGrey.shade900,
            Colors.blueGrey.shade700,
            Colors.blueGrey.shade500,
            Colors.blueGrey.shade700,
            Colors.blueGrey.shade900,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blueGrey.shade900,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 70,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter Your username....";
                }
              },
              onSaved: (val) {
                setState(() {
                  Global.userName = Global.userController.text;
                });
              },
              controller: Global.userController,
              decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  )),
            ),
            TextFormField(
              obscureText: (Global.isActive == false) ? true : false,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter Your password....";
                }
                return null;
              },
              onSaved: (val) {
                setState(() {
                  Global.password2 = Global.passWord2Controller.text;
                });
              },
              controller: Global.passWord2Controller,
              decoration: const InputDecoration(
                  hintText: "PassWord",
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  )),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                    backgroundColor: Colors.blueGrey.shade900),
                onPressed: () async {
                  if (homeKey.currentState!.validate()) {
                    homeKey.currentState!.save();
                    if (Global.email == Global.userName &&
                        Global.password == Global.password2) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLogged', true);
                      Navigator.of(context).pushReplacementNamed('home');
                    }
                  } else {
                    Navigator.of(context).pushNamed('home');
                  }
                  Global.user = Global.userController.text;
                  print(Global.user);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
            // GestureDetector(
            //   // onTap: () async {
            //   //   if (homeKey.currentState!.validate()) {
            //   //     homeKey.currentState!.save();
            //   //     if (Global.email == Global.userName &&
            //   //         Global.password == Global.password2) {
            //   //       SharedPreferences prefs =
            //   //           await SharedPreferences.getInstance();
            //   //       await prefs.setBool('isLogged', true);
            //   //       Navigator.of(context).pushReplacementNamed('home');
            //   //     }
            //   //   }
            //   //   return null;
            //   //   // else {
            //   //   //   Navigator.of(context).pushNamed('home');
            //   //   // }
            //   //   // Global.user = Global.userController.text;
            //   //   // print(Global.user);
            //   // },
            //   onTap: () {
            //     if (loginKey.currentState!.validate()) {
            //       loginKey.currentState!.save();
            //       Navigator.pushNamed(context, 'home');
            //     }
            //
            //     print("dfggas");
            //   },
            //   child: Container(
            //     height: 50,
            //     width: 350,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //         Colors.blueGrey.shade900,
            //         Colors.blueGrey.shade700,
            //         Colors.blueGrey.shade500,
            //         Colors.blueGrey.shade700,
            //         Colors.blueGrey.shade900
            //       ]),
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Sign In",
            //         style: TextStyle(color: Colors.white, fontSize: 17),
            //       ),
            //     ),
            //   ),
            // ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account?"),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text(
                      "  Sign up",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
