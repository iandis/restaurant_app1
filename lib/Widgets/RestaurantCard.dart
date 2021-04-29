
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app1/Models/_models.dart';

class RestaurantCard extends StatelessWidget{
  final RestaurantDetail restaurantDetail;
  final Function onPressed;
  const RestaurantCard({
    @required this.restaurantDetail,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey[50].withOpacity(0.3)),          
        elevation: MaterialStateProperty.all<double>(4.0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[50]),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.hovered))
              return Colors.grey[200];                
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.focused) )
              return Colors.grey[300];
            return null;
          }
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        
        children: [
          Hero(
            tag: restaurantDetail.id,
            child: CachedNetworkImage(
              height: 150,
              fit: BoxFit.cover,
              imageUrl: restaurantDetail.pictureId,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //restaurant name
                Text(
                  restaurantDetail.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
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
                //star + rating
                SizedBox(height: 10,), //separator
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.yellow[800],
                    ),
                    Text(
                      restaurantDetail.rating.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}