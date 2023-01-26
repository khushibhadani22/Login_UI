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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
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
              const SizedBox(
                height: 90,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your username....";
                  }
                },
                onSaved: (val) {
                  Global.userController.text;
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your password....";
                  }
                },
                onSaved: (val) {
                  Global.passWord2Controller.text;
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
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  if (homeKey.currentState!.validate()) {
                    homeKey.currentState!.save();
                    if (Global.userController.text ==
                            Global.emailController.text &&
                        Global.passWord2Controller.text ==
                            Global.passWordController.text) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      Navigator.of(context).pushReplacementNamed('home');
                    } else {
                      Navigator.of(context).pushNamed('login');
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blueGrey.shade900,
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade500,
                    Colors.blueGrey.shade700,
                    Colors.blueGrey.shade900
                  ])),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 270,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
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
      ),
    ));
  }
}
