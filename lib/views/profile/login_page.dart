import 'package:flutter/material.dart';
import 'package:food_ordering_app/bottom_navigation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:food_ordering_app/views/profile/register_page.dart';
import 'package:food_ordering_app/views/profile/reset_password_page.dart';

import '../../reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        body: Container(


          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 100, left: 35, right: 35),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/Login.png"),
                  reusableTextField(
                      "  e-mail", Icons.email_outlined, false,
                      _emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableTextField(
                      " password", Icons.lock_outline, true,
                      _passwordController),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: firebaseUIButton(context, "Sign in", () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigation()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                  ),
                  signUpOption(),
                  forgetPassword(),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",),
        Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 7),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: const Text(
              "  Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Row forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPasswordPage()));
          },
          child: const Text(
            "  Forgot Password ?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }


}
