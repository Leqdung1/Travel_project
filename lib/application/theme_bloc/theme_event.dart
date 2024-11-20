import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {}

class ThemeChange extends ThemeEvent {
  final bool isDark;

  ThemeChange(this.isDark);
}