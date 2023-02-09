import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
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
              height: 10,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const Text(
              "back",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
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
                child: Center(
                  child: Text(
                    "Login as ${Global.user}",
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  Global.passWordController.clear();
                  Global.passWord2Controller.clear();
                  Global.emailController.clear();
                  Global.userController.clear();
                  Navigator.of(context).pushNamed('/');
                },
                child: const Text(
                  "Delete account",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    ));
  }
}
