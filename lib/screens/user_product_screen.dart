import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user_product";

  Future<void> _refreshProduct(BuildContext context) async{
      Provider.of<Products>(context).fetchAndSetProducts();
    }

  @override
  Widget build(BuildContext context) {
    

    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[IconButton(onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }, icon: Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () {
          return _refreshProduct(context);
        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) {
              return Column(
                children: [
                  UserProductItem(
                    productsData.items[i].id, productsData.items[i].title, productsData.items[i].imageUrl),
                  Divider()
                ],
              );
                  
            },
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
