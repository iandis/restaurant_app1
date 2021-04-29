
import 'dart:convert';

import 'package:restaurant_app1/Models/Restaurant/RestaurantMenus.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;
  final RestaurantMenus menus;
  RestaurantDetail({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  RestaurantDetail copyWith({
    String id,
    String name,
    String description,
    String pictureId,
    String city,
    String rating,
    RestaurantMenus menus,
  }) {
    return RestaurantDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pictureId: pictureId ?? this.pictureId,
      city: city ?? this.city,
      rating: rating ?? this.rating,
      menus: menus ?? this.menus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': num.parse(rating),
      'menus': menus.toMap(),
    };
  }

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) {
    return RestaurantDetail(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      pictureId: map['pictureId'],
      city: map['city'],
      rating: (map['rating'] as num).toStringAsFixed(1),
      menus: RestaurantMenus.fromMap(map['menus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantDetail.fromJson(String source) => RestaurantDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantDetail(id: $id, name: $name, description: $description, pictureId: $pictureId, city: $city, rating: $rating, menus: $menus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RestaurantDetail &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.pictureId == pictureId &&
      other.city == city &&
      other.rating == rating &&
      other.menus == menus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      pictureId.hashCode ^
      city.hashCode ^
      rating.hashCode ^
      menus.hashCode;
  }
}
