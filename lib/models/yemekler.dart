class Yemekler {
  int yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  int yemek_fiyat;

  Yemekler(
      {required this.yemek_id,
      required this.yemek_adi,
      required this.yemek_resim_adi,
      required this.yemek_fiyat});

  factory Yemekler.fromJson(Map<String, dynamic> json) {
    int yemek_id = int.parse(json["yemek_id"].toString());
    int yemek_fiyat = int.parse(json["yemek_fiyat"].toString());
    return Yemekler(
        yemek_id: yemek_id,
        yemek_adi: json["yemek_adi"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_fiyat: yemek_fiyat);
  }
}
