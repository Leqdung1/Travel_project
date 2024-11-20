import "package:equatable/equatable.dart";

abstract class PopularDestinationEvent extends Equatable {
  const PopularDestinationEvent();
  @override
  List<Object?> get props => [];
}

class LoadPopularDestination extends PopularDestinationEvent {
  const LoadPopularDestination();

  @override
  List<Object?> get props => [];
}

class LoadedAllDestination extends PopularDestinationEvent {
  const LoadedAllDestination();

  @override
  List<Object?> get props => [];
}

class SearchDestinationsEvent extends PopularDestinationEvent {
  final String query; 

  const SearchDestinationsEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

