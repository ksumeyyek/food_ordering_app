import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/models/yemekler.dart';
import 'package:food_ordering_app/repo/fooddao_repository.dart';

class MainCubit extends Cubit<List<Yemekler>>{
  MainCubit():super(<Yemekler>[]);
  var yrepo=FoodDaoRepository();

  Future<void> foodsDowload() async {
    var list = await yrepo.takeAllFoods();
    emit(list);
  }
}
