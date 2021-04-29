
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app1/Models/_models.dart';

class RestaurantDetailScreen extends StatelessWidget{
  final RestaurantDetail restaurantDetail;

  const RestaurantDetailScreen({
    @required this.restaurantDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          //restaurant picture
          SliverToBoxAdapter(
            child: Hero(
              tag: restaurantDetail.id,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: restaurantDetail.pictureId,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //restaurant name
                  Text(
                    restaurantDetail.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //restaurant location
                  Text(
                    restaurantDetail.city,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  //restaurant rating
                  Text(
                    restaurantDetail.rating.toString(),
                  ),
                  //separator
                  SizedBox(height: 20,),
                  //restaurant description
                  Text(
                    restaurantDetail.description,
                  ),
                  //separator
                  SizedBox(height: 20,),
                  //Foods section label
                  Text(
                    'Foods',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Foods section
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Text(
                        restaurantDetail.menus.foods[i],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                childCount: restaurantDetail.menus.foods.length,
              ), 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
              ),
            ),
          ),
          //Drinks section label
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                'Drinks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //Drinks section
          SliverPadding(
            padding: EdgeInsets.fromLTRB(10,10,10,25),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: Colors.amberAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Text(
                        restaurantDetail.menus.drinks[i],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                childCount: restaurantDetail.menus.drinks.length,
              ), 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

}