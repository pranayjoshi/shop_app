import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                OrderButton(cart: cart)
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: ((context, index) => CartItem(
              cart.items.values.toList()[index].id,
              cart.items.keys.toList()[index],
              cart.items.values.toList()[index].title,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].price)),
          itemCount: cart.itemCount,
        ))
      ]),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: widget.cart.totalAmount <= 0 ? null :() async{
      setState(() {
        _isLoading = true;
      });
      Provider.of<Orders>(context, listen: false).addOrder(widget.cart.items.values.toList(), widget.cart.totalAmount);
      widget.cart.clear();
    }, child: Text("ORDER NOW"));
  }
}
