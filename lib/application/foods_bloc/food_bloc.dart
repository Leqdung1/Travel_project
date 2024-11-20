import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/home_repositories/food_repositories.dart';
import 'food_event.dart';
import 'food_state.dart';

class PopularFoodBloc extends Bloc<PopularFoodEvent, PopularFoodState> {
  final PopularFoodRepositories repositories;

  PopularFoodBloc({required this.repositories}) : super(const PopularFoodInitial()) {
    on<LoadedPopularFood>(_onFetch);
    on<LoadedAllFoods>(_onFetchList);
    on<SearchFoodsEvent>(_onSearch);
  }

  void _onFetch(LoadedPopularFood event, Emitter<PopularFoodState> emit) async {
    emit(const PopularFoodLoading());
    try {
      final foods = await repositories.getPopularFoods();
      emit(PopularFoodLoaded(foods));
    } catch (e) {
      emit(PopularFoodError(e.toString()));
    }
  }

  void _onFetchList(
      LoadedAllFoods event, Emitter<PopularFoodState> emit) async {
    emit(const PopularFoodLoading());
    try {
      final foods = await repositories.getListFood();
      emit(PopularFoodLoaded(foods));
    } catch (e) {
      emit(PopularFoodError(e.toString()));
    }
  }

  void _onSearch(SearchFoodsEvent event, Emitter<PopularFoodState> emit) async {
    emit(const PopularFoodLoading());

    try {
      final foods = await repositories.searchFoodsByTitle(event.query);

      emit(PopularFoodLoaded(foods));
     
    } catch (e) {
      emit(PopularFoodError(e.toString()));
    }
  }
}
