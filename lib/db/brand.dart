import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class BrandServices {
  String ref = 'brandies';

  Firestore _firestore = Firestore.instance;

  Future<void> createBrand(String name) async {
    var id = new Uuid();

    Firestore _firestore = await Firestore.instance;

    String brandId = id.v1();
    _firestore.collection(ref).document(brandId).setData({'brandName': name});
  }

  Future<List<DocumentSnapshot>> getbrands() async {
    Firestore _firestore = await Firestore.instance;

    return _firestore.collection(ref).getDocuments().then((snaps) {
      print(snaps.documents.length);
      return snaps.documents;
    });
  }

  Future getSuggestion(String Suggestion) => _firestore
          .collection(ref)
          .where('brandName', isEqualTo: Suggestion)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });
}
