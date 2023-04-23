import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;

  Product({required this.id, required this.title, required this.price, required this.description, required this.imageUrl, this.isFavourite = false});

  void toggleFavourite(){
    isFavourite = !isFavourite;
    notifyListeners();
  }

  void toggleFavoriteStatus() {}

}