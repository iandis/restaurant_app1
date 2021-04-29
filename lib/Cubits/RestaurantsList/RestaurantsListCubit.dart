import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app1/LocalData.dart';
import 'package:restaurant_app1/Models/_models.dart';

part 'RestaurantsListState.dart';

class RestaurantsListCubit extends Cubit<RestaurantsListState> {
  
  RestaurantsListCubit() : super(RestaurantsListState.init());

  void loadList(){
    emit(
      state.copyWith(
        status: RestaurantsListStatus.loading,
      )
    );
    
    try{
      var data = json.decode(LocalRestaurant.data)['restaurants'];
      var restaurants = List<RestaurantDetail>.generate(data.length, (i) => 
        RestaurantDetail.fromMap(data[i])
      );
      emit(
        state.copyWith(
          restaurants: restaurants,
          status: RestaurantsListStatus.loaded,
        )
      );
    }catch(e, st){
      print(st);
      emit(
        state.copyWith(
          status: RestaurantsListStatus.error,
        )
      );
    }
  }
}
