
import 'package:flutter/material.dart';
import 'package:restaurant_app1/Models/_models.dart';
import 'package:restaurant_app1/Screens/_screens.dart';

class AppRoutes{
  static const home = '/';
  static const restaurantDetail = '/restaurantDetail';
}

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (_) {
        switch(settings.name){
          case AppRoutes.restaurantDetail:
            var restaurant = settings.arguments as RestaurantDetail;
            return RestaurantDetailScreen(restaurantDetail: restaurant);
          default:
            return RestaurantListScreen();
        }
      }
    );
  }
}