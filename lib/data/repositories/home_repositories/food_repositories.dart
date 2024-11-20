import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/Home/food_model.dart';


class PopularFoodRepositories {
    CollectionReference collectFoods =
        FirebaseFirestore.instance.collection('Food');

  Future<List<FoodModel>> getPopularFoods() async {
  
    await Future.delayed(const Duration(seconds: 2));

    QuerySnapshot snapshot =
        await collectFoods.where('isHot', isEqualTo: 1).get();

    return snapshot.docs.map((doc) {
      return FoodModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<FoodModel>> getListFood() async {
    QuerySnapshot snapshot = await collectFoods.get();

    return snapshot.docs.map((doc) {
      return FoodModel.fromJson((doc.data() as Map<String, dynamic>));
    }).toList();
  }

  Future<List<FoodModel>> searchFoodsByTitle(String query) async {
     print('Searching for cultures with title: $query'); 
    QuerySnapshot snapshot = await collectFoods.where('title', isGreaterThanOrEqualTo: query.toLowerCase()).where('title', isLessThanOrEqualTo: query.toLowerCase() + '\uf8ff').get();
print('Searching for: $query, lowercased: ${query.toLowerCase()}');

    return snapshot.docs.map((doc) {
      return FoodModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
