import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChange>((event, emit) {
      emit(
        event.isDark ? ThemeMode.dark : ThemeMode.light,
      );
    });
  }
}
