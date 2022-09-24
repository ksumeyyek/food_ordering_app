import 'package:flutter/material.dart';

class End extends StatefulWidget {
  const End({Key? key}) : super(key: key);

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top:50),
        child:Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset("assets/Delivery.png"),
          Text("Your order has been placed",style: TextStyle(color: Color(0xFFd81b60),fontSize: 25),),
          SizedBox(height: 10,),
          Text("it's way",style: TextStyle(color: Color(0xFFd81b60),fontSize: 30),),
        ],
      ),)
    );
  }
}
