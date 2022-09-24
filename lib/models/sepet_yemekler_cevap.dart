import 'package:food_ordering_app/models/sepet_yemekler.dart';

class SepetYemeklerCevap{
  List<SepetYemekler>sepetyemekler;
  int success;

  SepetYemeklerCevap({required this.sepetyemekler,required this.success});
  factory SepetYemeklerCevap.fromJson(Map<String,dynamic>json){
    var jsonArray=json["sepet_yemekler"] as List;
    List<SepetYemekler> sepetyemekler = jsonArray
        .map((jsonArrayObject) => SepetYemekler.fromJson(jsonArrayObject))
        .toList();
    int success=json["success"]as int;
    return SepetYemeklerCevap(sepetyemekler: sepetyemekler, success: success);
  }
}
