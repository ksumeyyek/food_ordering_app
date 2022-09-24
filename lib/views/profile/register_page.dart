import 'package:flutter/material.dart';
import '../../bottom_navigation.dart';
import '../../reusable_widgets/reusable_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 20,  fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(

            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(top: 25, left: 35, right: 35),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/Sign.png"),
                  reusableTextField(" username", Icons.person_outline, false,
                      _nameController),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      " e-mail", Icons.email_outlined, false, _emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableTextField(" password", Icons.lock_outlined, true,
                      _passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  firebaseUIButton(context, "Sign Up", () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigation()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  })
                ],
              ),
            ))),
      ),
    );
  }
}
