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

  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        'flutter-test1-e3bd1-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/orders.json');
    try {
      final res = await http.get(url);
      var extractedData =  json.decode(res.body);
      final List<OrderItem> loadedList = [];
      if (extractedData == null){
        return;
      } else {
        extractedData = json.decode(res.body) as Map<String, dynamic>;
      }
      extractedData.forEach((key, data) {
        loadedList.add(OrderItem(
            id: key,
            amount: data['amount'],
            products: (data['products'] as List<dynamic>)
                .map((e) => CartItem(
                    id: e["id"],
                    title: e["title"],
                    quantity: e["quantity"],
                    price: e["price"]))
                .toList(),
            dateTime: DateTime.parse(data["dateTime"])));
      });
      _orders = loadedList.reversed.toList();
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.https(
        'flutter-test1-e3bd1-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/orders.json');

    final timestamp = DateTime.now();

    final res = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                  })
              .toList()
        }));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(res.body)["name"],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
