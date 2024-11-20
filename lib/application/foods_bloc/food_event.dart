import 'package:equatable/equatable.dart';

abstract class PopularFoodEvent extends Equatable {
  const PopularFoodEvent();

  @override
  List<Object?> get props => [];
}

class LoadedPopularFood extends PopularFoodEvent {
  const LoadedPopularFood();

  @override
  List<Object?> get props => [];
}

class LoadedAllFoods extends PopularFoodEvent {
  const LoadedAllFoods();

  @override
  List<Object?> get props => [];
}

class SearchFoodsEvent extends PopularFoodEvent {
  final String query;

  const SearchFoodsEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
