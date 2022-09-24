import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:food_ordering_app/models/sepet_yemekler.dart';
import 'package:food_ordering_app/models/sepet_yemekler_cevap.dart';

import 'package:food_ordering_app/models/yemekler.dart';
import 'package:food_ordering_app/models/yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class FoodDaoRepository {
  List<Yemekler> parseFoodsAnswer(String answer) {
    return YemeklerCevap.fromJson(json.decode(answer)).yemekler;
  }

  List<SepetYemekler> parseCartAnswer(String answer) {
    return SepetYemeklerCevap.fromJson(json.decode(answer)).sepetyemekler;
  }

  Future<List<Yemekler>> takeAllFoods() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await Dio().get(url);
    return parseFoodsAnswer(answer.data.toString());
  }

  Future<void> addCart(String yemek_adi, String yemek_resim_adi,
      int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";

    var data = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };

    var answer = await Dio().post(
      url,
      data: FormData.fromMap(data),
      /* options: Options(headers: {
          "content-type": "application/json",
          "accept": "application/json",
        })*/
    );

    /* log("reqBody = " + data.toString());
    log("resBody = " + answer.data);*/
    print("food add ${answer.data.toString()}");
  }

  Future<List<SepetYemekler>> takeCartFoods(String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var data = {"kullanici_adi": kullanici_adi};
    var answer = await Dio().post(url,
        data: FormData.fromMap(data),
        options: Options(headers: {
          "content-type": "application/json",
          "accept": "application/json",
        }));

    log("reqBody = " + data.toString());
    log("resBody = " + answer.data);
      return parseCartAnswer(answer.data.toString());

  }

  Future<void> deleteFoods(int sepet_yemek_id, String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var data = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullanici_adi
    };
    var answer = await Dio().post(url,
        data: FormData.fromMap(data),
        options: Options(headers: {
          "content-type": "application/json",
          "accept": "application/json",
        }));
    log("reqBody = " + data.toString());
    log("resBody = " + answer.data);
    print("food delete: ${answer.data.toString()}");
  }

}
