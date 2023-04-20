import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions {
  Favourites,
  All
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only favourites"),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              )
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == FilterOptions.Favourites){

              } else {
                
              }
            },
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
