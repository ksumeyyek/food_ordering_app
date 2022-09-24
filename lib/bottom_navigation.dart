import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/cart_page.dart';
import 'package:food_ordering_app/views/main_page.dart';
import 'package:food_ordering_app/views/profile/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int chooseIndeks=0;
  var pageList=[ MainPage(), CartPage(),const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pageList[chooseIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ],
        onTap: (indeks){
          setState(() {
            chooseIndeks=indeks;
          });
        },
        currentIndex: chooseIndeks,
        backgroundColor: Color(0xFFd81b60),
        selectedItemColor:Color(0xFF560027) ,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
