import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  String ref = 'products';

  Firestore _firestore = Firestore.instance;

  Future<void> upLoadProduct(
      {String productName,
      String brand,
      String category,
      List sizes,
      List images,
      int quantity,
      double price,
      }) async {
    var id = new Uuid();

    String productId = id.v1();
    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'id': productId,
      'brand': brand,
      'categroy': category,
    });
  }
}
