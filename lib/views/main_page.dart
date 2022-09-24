import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/cubit/main_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ordering_app/models/yemekler.dart';

import 'package:food_ordering_app/views/detail_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool searching = false;

  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().foodsDowload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: searching
            ? TextField(
                decoration: const InputDecoration(
                  hintText: "Search",
                ),
                onChanged: (foodName) {
                  //findPersonUsingFirstWhere(foodd, foodName);
                },
              )
            : const Text(
                "FOODER",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
        actions: [
          searching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searching = false;
                    });
                    context.read<MainCubit>().foodsDowload();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searching = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: CarouselSlider(
                      options: CarouselOptions(

                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        Image.asset(
                          "assets/carousel/clock.png",
                          width: 450,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/carousel/discount.png",
                          width: 450,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        Image.asset("assets/carousel/hot.png",
                            width: 450, height: 200, fit: BoxFit.fill),
                      ],
                    ),
                  ),

                  SizedBox(
                    child: BlocBuilder<MainCubit, List<Yemekler>>(
                      builder: (context, foodsList) {
                        if (foodsList.isNotEmpty) {
                          return Padding(
                            padding:
                            const EdgeInsets.only(top: 5, left: 15, right: 15),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: foodsList.length, //3
                              itemBuilder: (context, indeks) {
                                //0,1,2
                                var food = foodsList[indeks];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(food: food)),
                                    );
                                  },
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 2),
                                          child: SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: Image.network(
                                              "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${food.yemek_adi}  ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(
                                            "${food.yemek_fiyat}.00 ₺",
                                            style: TextStyle(
                                                color: Color(0xFFa00037),
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                          width: 100,
                                          child: RaisedButton(

                                            color: Color(0xFF9e9e9e),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailPage(food: food)));
                                            },
                                            child: const Text(
                                              'Detail',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: (0.9 / 1.15),
                                crossAxisCount: 2,
                              ),
                            ),
                          );
                        } else {
                          return const Center();
                        }
                      },
                    ),
                  ),

                ],
              ),
      ),
      
    );
  }
}
