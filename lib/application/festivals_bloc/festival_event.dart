import 'package:equatable/equatable.dart';

abstract class PopularFestivalEvent extends Equatable {
  const PopularFestivalEvent();

  @override
  List<Object?> get props => [];
}

class LoadedPopularFestival extends PopularFestivalEvent {
  const LoadedPopularFestival();

  @override
  List<Object?> get props => [];
}

class LoadedAllFestival extends PopularFestivalEvent {
  const LoadedAllFestival();

  @override
  List<Object?> get props => [];
}

class SearchFestivalsEvent extends PopularFestivalEvent {
  final String query;

  const SearchFestivalsEvent({required this.query});

  @override
 
  List<Object?> get props => [query];
}
