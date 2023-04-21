import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title,required this.quantity,required this.price});
}
class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title){
    if (_items.containsKey(productId)){
      _items.update(productId, (eci) => CartItem(id: eci.id, title: eci.title, quantity: eci.quantity+1, price: eci.price));
    } else {
      _items.putIfAbsent(productId,() => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
  }

}