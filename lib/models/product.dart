import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imageUrl,
      this.isFavourite = false});

  void setFavStat(bool oldStatus){
    isFavourite = oldStatus;
    notifyListeners();
  }

  Future<void> toggleFavourite() async {
    final url = Uri.https(
        'flutter-test1-e3bd1-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/products/${id}.json');

    var oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    try {
      final res = await http.patch(url,
          body: json.encode({'isFavourite': isFavourite}));
      if (res.statusCode >=400){
        setFavStat(oldStatus);
      }
    } catch (err) {
      setFavStat(oldStatus);
    }
  }
}
