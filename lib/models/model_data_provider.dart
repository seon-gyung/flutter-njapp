// models/model_item_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:njapp/models/model_data.dart';
import 'model_data.dart';

class DataProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<Data> datas = [];

  DataProvider({reference}) {
    itemsReference = reference ?? FirebaseFirestore.instance.collection('items');
  }

  Future<void> fetchItems() async {
    datas = await itemsReference.get().then( (QuerySnapshot results) {
      return results.docs.map( (DocumentSnapshot document) {
        return Data.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}