import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:food_ordering_app/views/profile/login_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            "Hesap Bilgileri",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _inputField(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Sümeyye Korkmaz",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            ProfilePicture(
              name: 'Sumeyye Korkmaz',
              radius: 31,
              fontsize: 21,
              img: "https://media-exp1.licdn.com/dms/image/C4E03AQGtwBxya_a19Q/profile-displayphoto-shrink_800_800/0/1662546497848?e=1669248000&v=beta&t=qfHeZrHSfoA-_CaXpB_nLkQrvqcCR1U921OLI2ElJIM",
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(

          decoration: InputDecoration(

            hintText: "E-posta Adresin",
            labelText: "sumeyyekorkmaz90@gmail.com",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly:true ,
          decoration: InputDecoration(
            hintText: "Kullanıcı Adı",
            labelText: "Kullanıcı Adı",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.arrow_forward_sharp),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        SizedBox(
          height: 10,
        ),


        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 35,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),color: Theme.of(context).primaryColor),
            child: Center(
                child: Text(
              "Kaydet",

            )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut().then((value){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));
              });

          },
          child: Container(
            height: 35,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),color: Theme.of(context).primaryColor),
            child: Center(
                child: Text(
              "Oturumu Kapat",

            )),
          ),
        )
      ],
    );
  }
}
