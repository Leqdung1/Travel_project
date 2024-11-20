import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/Home/culture_model.dart';
import '../../presentation/widgets/custome_snackbar.dart';

class SavedCulturesCubit extends Cubit<List<CultureModel>> {
  SavedCulturesCubit() : super([]);

  void toggleSave(BuildContext context, CultureModel items) {
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
