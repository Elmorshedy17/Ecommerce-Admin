import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CateGoryServices {
  String ref = 'categories';
  Firestore _firestore = Firestore.instance;

  Future<void> createCatergory(String name) async {
    Firestore _firestore = await Firestore.instance;

    var id = new Uuid();
    String cateId = id.v1();
    _firestore
        .collection(ref)
        .document(cateId)
        .setData({'category name': name});
  }

  Future<List<DocumentSnapshot>> getcategories() async {
    Firestore _firestore = await Firestore.instance;

    return _firestore.collection(ref).getDocuments().then((snaps) {
      print(snaps.documents.length);
      return snaps.documents;
    });
  }

  Future getSuggestion(String Suggestion) => _firestore
          .collection(ref)
          .where('category name', isEqualTo: Suggestion)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });
}
