import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/cubit/cart_cubit.dart';
import 'package:food_ordering_app/cubit/main_cubit.dart';

import 'package:food_ordering_app/models/sepet_yemekler.dart';
import 'package:food_ordering_app/models/yemekler.dart';
import 'package:food_ordering_app/views/end.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void initState() {
    super.initState();
    context.read<CartCubit>().cartList("sumeyye_korkmaz");
  }

  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: searching
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  //context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : const Text("My Cart"),
        actions: [
          searching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searching = false;
                    });
                    context.read<CartCubit>().cartList("sumeyye_korkmaz");
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
      body: BlocBuilder<CartCubit, List<SepetYemekler>>(
        builder: (context, foodsList) {
          if (foodsList.isNotEmpty) {
            return ListView.builder(
              itemCount: foodsList.length,
              itemBuilder: (context, indeks) {
                var food = foodsList[indeks];
                var total = food.yemek_siparis_adet * food.yemek_fiyat;

                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                heroTag: false,
                                backgroundColor:
                                    Color(0xFFd81b60).withOpacity(0.7),
                                onPressed: () {},
                                child: Text(
                                  "${food.yemek_siparis_adet}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                  "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}")),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, bottom: 5, right: 10),
                                child: Text(
                                  "${food.yemek_adi}",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("${total}.00 ₺ "),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              IconButton(
                                  iconSize: 25,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "${food.yemek_adi} deleted?"),
                                      action: SnackBarAction(
                                        label: "yes",
                                        onPressed: () {
                                          //    if (foodsList.length > 1) {
                                          setState(() {
                                            context
                                                .read<CartCubit>()
                                                .delete(food.sepet_yemek_id,
                                                    "sumeyye_korkmaz")
                                                .then((value) {
                                              setState(() {
                                                foodsList.removeWhere(
                                                    (element) =>
                                                        element
                                                            .sepet_yemek_id ==
                                                        food.sepet_yemek_id);
                                              });
                                            });
                                          });
                                        },
                                        //}
                                      ),
                                    ));
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: const Text("Cart is empty",style: TextStyle(fontSize: 25),));
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Text(
                "Total Price:",
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              SizedBox(
                width: 130,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFd81b60)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => End()));
                  },
                  child: const Text(
                    "Order",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
