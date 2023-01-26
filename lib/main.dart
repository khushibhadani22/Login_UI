import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'login': (context) => const LogIn(),
      'home': (context) => const HomePage(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

GlobalKey<FormState> loginKey = GlobalKey<FormState>();

class _MyAppState extends State<MyApp> {
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
          child: Form(
            key: loginKey,
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
                  height: 10,
                ),
                const Text(
                  "Create",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your Email....";
                    }
                  },
                  onSaved: (val) {
                    Global.emailController.text;
                  },
                  controller: Global.emailController,
                  decoration: const InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      )),
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your Password....";
                    }
                  },
                  onSaved: (val) {
                    Global.passWordController.text;
                  },
                  controller: Global.passWordController,
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
                  onTap: () {
                    if (loginKey.currentState!.validate()) {
                      loginKey.currentState!.save();
                      setState(() {
                        Navigator.of(context).pushReplacementNamed('login');
                      });
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 220,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('login');
                        },
                        child: const Text(
                          "  Sign in",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Global {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passWordController = TextEditingController();
  static TextEditingController userController = TextEditingController();
  static TextEditingController passWord2Controller = TextEditingController();
}
