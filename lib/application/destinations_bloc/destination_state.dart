import 'package:equatable/equatable.dart';

import '../../data/models/Home/destinations_model.dart';


abstract class PopularDestinationState extends Equatable {
  const PopularDestinationState();

  @override
  List<Object> get props => [];
}

class PopularDestinationInitial extends PopularDestinationState {
  const PopularDestinationInitial();

  @override
  List<Object> get props => [];
}

class PopularDestinationLoading extends PopularDestinationState {
  const PopularDestinationLoading();

  @override
  List<Object> get props => [];
}

class PopularDestinationLoaded extends PopularDestinationState {
  final List<DestinationsModels> destination;

  const PopularDestinationLoaded(this.destination);

  @override
  List<Object> get props => [destination];
}

class PopularDestinationError extends PopularDestinationState {
  final String message;
  const PopularDestinationError(this.message);

  @override
  List<Object> get props => [message];
}
