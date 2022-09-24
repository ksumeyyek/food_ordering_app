import 'package:food_ordering_app/models/yemekler.dart';

class YemeklerCevap {
  List<Yemekler> yemekler;
  int success;

  YemeklerCevap({required this.yemekler, required this.success});

  factory YemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemekler = jsonArray
        .map((jsonArrayObject) => Yemekler.fromJson(jsonArrayObject))
        .toList();
    int success = json["success"] as int;
    return YemeklerCevap(yemekler: yemekler, success: success);
  }
}
