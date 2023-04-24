import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.title,  this.quantity, this.price,);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: ListTile(
        leading: CircleAvatar(child: Text('\$$price')),
        title: Text(title),
        subtitle: Text('Total: \$${price * quantity}'),
        trailing: Text('$quantity x'),
      ),
    );
  }
}
