
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app1/Cubits/_cubits.dart';
import 'package:restaurant_app1/Router/AppRouter.dart';
import 'package:restaurant_app1/Widgets/RestaurantCard.dart';

class RestaurantListScreen extends StatefulWidget{

  @override 
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen>{

  @override
  void initState() {
    super.initState();
    context.read<RestaurantsListCubit>().loadList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantsListCubit, RestaurantsListState>(
      listener: (context, state) {
        if(state.status == RestaurantsListStatus.error)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[900],
              action: SnackBarAction(
                label: 'Reload',
                textColor: Colors.amber,
                onPressed: () => context.read<RestaurantsListCubit>().loadList(),
              ),
              content: Text(
                'Unknown error occured. Please try again.'
              ),
            )
          );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Restaurants'),
          ),
          body: body(state),
        );
      }, 
    );
  }

  Widget body(RestaurantsListState state){
    switch(state.status){
      case RestaurantsListStatus.loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      default:
        return RefreshIndicator(
          onRefresh: () async {
              context.read<RestaurantsListCubit>().loadList();
              return true;
          },
          child: GridView(
            padding: EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            children: List.generate(
              state.restaurants.length, 
              (i) => Builder(
                builder: (_) { 
                  var restaurant = state.restaurants[i];
                  return RestaurantCard(
                    restaurantDetail: restaurant, 
                    onPressed: () async => await Navigator.of(context).pushNamed(
                      AppRoutes.restaurantDetail,
                      arguments: restaurant),
                  );
                }
              )),
          ),
        );
    }
  }

}