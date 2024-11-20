import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/Home/culture_model.dart';


class PopularCultureRepositories {
  CollectionReference collectCultures =
      FirebaseFirestore.instance.collection('Culture');

  Future<List<CultureModel>> getPopularCultures() async {
    await Future.delayed(const Duration(seconds: 2));

    QuerySnapshot snapshot =
        await collectCultures.where('isHot', isEqualTo: 1).get();

    return snapshot.docs.map((doc) {
      return CultureModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<CultureModel>> getListCulture() async {
    await Future.delayed(const Duration(milliseconds: 2));

    QuerySnapshot snapshot = await collectCultures.get();

    return snapshot.docs.map((doc) {
      return CultureModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<CultureModel>> filterCulture() async {
    await Future.delayed(const Duration(milliseconds: 2));

    QuerySnapshot snapshot = await collectCultures.get();

    return snapshot.docs.map((doc) {
      return CultureModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<CultureModel>> searchCulturesByTitle(String query) async {
    if (kDebugMode) {
      print('Searching for: $query');
    }

    QuerySnapshot snapshot = await collectCultures
        .where('title', isGreaterThanOrEqualTo: query.toLowerCase())
        .where('title', isLessThanOrEqualTo: '${query.toLowerCase()}\uf8ff')
        .get();

    if (kDebugMode) {
      print('Found ${snapshot.docs.length} documents');
    }
    if (kDebugMode) {
      print('Searching for: $query, lowercased: ${query.toLowerCase()}');
    }

    return snapshot.docs.map((doc) {
      if (kDebugMode) {
        print(doc.data());
      }
      return CultureModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
