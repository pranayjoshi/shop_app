import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserProductItem extends StatelessWidget {

  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      trailing: Row(children: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.edit), color: Theme.of(context).primaryColor,),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Theme.of(context).colorScheme.error,)
      ]),
    );
  }
}