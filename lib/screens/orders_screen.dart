import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';

class OrdersScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Orders")),
      body: ListView.builder(itemBuilder:(context, index) => , itemCount: orderData.orders.length,),
    );
  }
}