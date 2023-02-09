import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefere = await SharedPreferences.getInstance();
  bool? isLogged = prefere.getBool('isLogged') ?? false;
  bool? isCreate = prefere.getBool('isSignup') ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (isCreate == false)
        ? '/'
        : (isLogged == false)
            ? 'login'
            : 'home',
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
              const Spacer(),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your Email....";
                  }
                },
                onSaved: (val) {
                  setState(() {
                    Global.email = Global.emailController.text;
                  });
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
                obscureText: (Global.isActive == false) ? true : false,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your Password....";
                  }
                },
                onSaved: (val) {
                  setState(() {
                    Global.password = Global.passWordController.text;
                  });
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
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                      backgroundColor: Colors.blueGrey.shade900),
                  onPressed: () async {
                    SharedPreferences prefers =
                        await SharedPreferences.getInstance();
                    await prefers.setBool('isSignUp', true);
                    await prefers.setString(
                        'email', Global.emailController.text);
                    await prefers.setString(
                        'password', Global.passWordController.text);
                    if (loginKey.currentState!.validate()) {
                      loginKey.currentState!.save();
                      Navigator.of(context).pushReplacementNamed('login');
                    }
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
              const Spacer(),
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
    ));
  }
}

class Global {
  static String? email;
  static String? password;
  static String userName = '';
  static String password2 = '';
  static String? user;
  static bool isActive = false;
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passWordController = TextEditingController();
  static TextEditingController userController = TextEditingController();
  static TextEditingController passWord2Controller = TextEditingController();
}
