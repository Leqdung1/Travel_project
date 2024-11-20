import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Home/destinations_model.dart';
import '../../presentation/widgets/custome_snackbar.dart';


class SavedDestinationsCubit extends Cubit<List<DestinationsModels>> {
  SavedDestinationsCubit() : super([]);

  void toogleSave(BuildContext context, DestinationsModels items) {
    bool isSaved;
    if (state.contains(items)) {
      emit(state.where((element) => element.image != items.image).toList());
      isSaved = false;
    } else {
      emit([...state, items]);
      isSaved = true;
    }
    final message = isSaved ? 'Saved!' : 'Unsaved!';
    customSnackBar(context, message);
  }
}
