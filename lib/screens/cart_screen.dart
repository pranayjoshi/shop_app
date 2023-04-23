import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(children: <Widget>[
        Card(margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(children: <Widget>[
              Text("Total",
                style: TextStyle(fontSize: 20)
              ),
              SizedBox(width: 10,),
              Chip(label: Text(""))  
            ],),
            ),
        )
      ]),
    );
  }
}
