part of 'RestaurantsListCubit.dart';

enum RestaurantsListStatus{
  init,
  loading,
  loaded,
  error,
}

class RestaurantsListState extends Equatable {
  final List<RestaurantDetail> restaurants;
  final RestaurantsListStatus status;

  const RestaurantsListState({
    @required this.restaurants,
    @required this.status,
  });

  factory RestaurantsListState.init() => 
    RestaurantsListState(
      restaurants: [], 
      status: RestaurantsListStatus.init,
    );

  @override
  List<Object> get props => [restaurants, status];

  RestaurantsListState copyWith({
    List<RestaurantDetail> restaurants,
    RestaurantsListStatus status,
  }) {
    return RestaurantsListState(
      restaurants: restaurants ?? this.restaurants,
      status: status ?? this.status,
    );
  }
}
