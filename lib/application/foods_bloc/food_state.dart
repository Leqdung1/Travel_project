import 'package:equatable/equatable.dart';

import '../../data/models/Home/food_model.dart';


abstract class PopularFoodState extends Equatable {
  const PopularFoodState();

  @override
  List<Object> get props => [];
}

class PopularFoodInitial extends PopularFoodState {
  const PopularFoodInitial();

  @override
  List<Object> get props => [];
}

class PopularFoodLoading extends PopularFoodState {
  const PopularFoodLoading();

  @override
  List<Object> get props => [];
}

class PopularFoodLoaded extends PopularFoodState {
  final List<FoodModel> food;

  const PopularFoodLoaded(this.food);

  @override
  List<Object> get props => [food];
}

class PopularFoodError extends PopularFoodState {
  final String message;
  const PopularFoodError(this.message);

  @override
  List<Object> get props => [message];
}
