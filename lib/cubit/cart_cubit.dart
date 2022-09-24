import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/models/sepet_yemekler.dart';

import '../repo/fooddao_repository.dart';

class CartCubit extends Cubit<List<SepetYemekler>> {
  CartCubit() : super(<SepetYemekler>[]);

  var frepo = FoodDaoRepository();

  Future<void> cartList(String kullanici_adi) async {
    var list = await frepo.takeCartFoods(kullanici_adi);

    emit(list);
  }
  Future<void> delete(int sepet_yemek_id,String kullanici_adi) async {
    await frepo.deleteFoods(sepet_yemek_id, kullanici_adi);
  }
}
