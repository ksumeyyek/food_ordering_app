import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/profile/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/Take.png"),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "FOODER",
                style: GoogleFonts.sriracha(
                  fontSize: 48,
                ),
              ),
            ),
            Text(
              "The Most Delicious Foods Here",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 25),
              child: Text(
                "You can order 7/24",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: 160,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Row(
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
