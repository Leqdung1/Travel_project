import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/Home/food_model.dart';
import '../../presentation/widgets/custome_snackbar.dart';

class SavedFoodsCubit extends Cubit<List<FoodModel>> {
  SavedFoodsCubit() : super([]);

  void toogleSave(BuildContext context, FoodModel items) {
    bool isSaved;
    if (state.contains(items)) {
      emit(state.where((item) => item.image != items.image).toList());
      isSaved = false;
    } else {
      emit([...state, items]);
      isSaved = true;
    }
    final message = isSaved ? 'Saved!' : 'Unsaved!';
    customSnackBar(context, message);
  }
}
