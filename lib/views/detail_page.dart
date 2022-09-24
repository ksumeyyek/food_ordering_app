import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/bottom_navigation.dart';
import 'package:food_ordering_app/models/yemekler.dart';
import 'package:food_ordering_app/cubit/detail_cubit.dart';
import 'package:provider/provider.dart';

import '../cubit/detail_cubit.dart';


class DetailPage extends StatefulWidget {
  Yemekler food;

  DetailPage({required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var food = widget.food;
    var total = _counter * (food.yemek_fiyat);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Detail",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 10),
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                    "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}")),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "${food.yemek_adi} ",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, right: 15, left: 15),
              child: Text(
                "Store in a cool and dry environment. "
                "Drink cold. ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              "${total}.00 ₺",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 40,
                      child: FloatingActionButton(
                        heroTag:false,
                        backgroundColor: Color(0xFFd81b60),
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 3),
                    child: Text(
                      "$_counter",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: FloatingActionButton(
                      heroTag: false,
                        backgroundColor: Color(0xFFd81b60),
                        onPressed: () {
                          if (_counter > 0) {
                            _decrementCounter();
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 130,
                height: 45,
                child: ElevatedButton(

                    onPressed: () {

                        context.read<DetailCubit>().pushCart(
                            widget.food.yemek_adi,
                            widget.food.yemek_resim_adi,
                            widget.food.yemek_fiyat,
                            _counter,
                            "sumeyye_korkmaz");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigation()));
                    },
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
