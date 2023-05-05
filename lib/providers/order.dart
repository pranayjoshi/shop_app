import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) async{
    final url = Uri.https(
      'flutter-test1-e3bd1-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/products.json');

    final timestamp = DateTime.now();

    http.post(url, body: json.encode({
      'amount': total,
      'dateTime': timestamp.toIso8601String(),
      'prodcus': cartProducts.map((e) =>{
        'id': e.id,
        'title': e.title,
        'quantity': e.quantity,
        'price':e.price,
      })
    }));
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
