import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/repo/fooddao_repository.dart';

class DetailCubit extends Cubit<void>{
  DetailCubit():super(0);

  var frepo=FoodDaoRepository();

  Future<void> pushCart(String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi)async{
    await frepo.addCart(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);

  }


}
