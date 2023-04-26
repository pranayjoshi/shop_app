import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  
  static const routeName = "/orders_screen";

  @override
  Widget build(BuildContext context) {

    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Orders")),
      body: ListView.builder(itemBuilder:(context, index) => OrderItem(orderData.orders[index]), itemCount: orderData.orders.length,),
      drawer: AppDrawer(),
    );
  }
}