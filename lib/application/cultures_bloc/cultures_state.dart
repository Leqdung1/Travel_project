import 'package:equatable/equatable.dart';

import '../../data/models/Home/culture_model.dart';


abstract class PopularCultureState extends Equatable {
  const PopularCultureState();

  @override
  List<Object> get props => [];
}

class PopularCultureInitial extends PopularCultureState {
  const PopularCultureInitial();

  @override
  List<Object> get props => [];
}

class PopularCultureLoading extends PopularCultureState {
  const PopularCultureLoading();

  @override
  List<Object> get props => [];
}

class PopularCultureLoaded extends PopularCultureState {
  final List<CultureModel> culture;

  const PopularCultureLoaded(
    this.culture,
  );

  @override
  List<Object> get props => [culture];
}

class PopularCultureError extends PopularCultureState {
  final String message;
  const PopularCultureError(this.message);

  @override
  List<Object> get props => [message];
}


