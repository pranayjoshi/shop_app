import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
            },
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () {
              Provider.of<Products>(context, listen: false).deleteProduct(id);
            },
            icon: Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
          )
        ]),
      ),
    );
  }
}
