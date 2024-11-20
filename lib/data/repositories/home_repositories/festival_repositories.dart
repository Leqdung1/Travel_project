import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/Home/festival_model.dart';


class PopularFestivalRepositories {
  CollectionReference collectFestivals =
      FirebaseFirestore.instance.collection('Festivals');

  // Popular Festivals
  Future<List<FestivalModel>> getPopularFestivals() async {
    await Future.delayed(const Duration(seconds: 2));

    QuerySnapshot snapshot =
        await collectFestivals.where('isHot', isEqualTo: 1).get();

    return snapshot.docs.map((doc) {
      return FestivalModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  // List All Festivals
  Future<List<FestivalModel>> getListFestival() async {
    await Future.delayed(const Duration(milliseconds: 2));

    QuerySnapshot snapshot = await collectFestivals.get();

    return snapshot.docs.map((doc) {
      return FestivalModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  // ignore: non_constant_identifier_names
  Future<List<FestivalModel>> SearchFestivalsByTitle(String query) async{
    
    QuerySnapshot snapshot = await collectFestivals.where('title', isGreaterThanOrEqualTo: query.toLowerCase(),).where('title', isLessThanOrEqualTo: query.toLowerCase() + '\uf8ff').get();
print('Searching for: $query, lowercased: ${query.toLowerCase()}');

    return snapshot.docs.map((doc) {
      return FestivalModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
