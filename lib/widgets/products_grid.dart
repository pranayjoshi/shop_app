import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showonlyFav;

  ProductsGrid(this.showonlyFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final LoadedProducts = showonlyFav ? productsData.favItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: LoadedProducts[i],
        child: ProductItem(),
      ),
      itemCount: LoadedProducts.length,
    );
  }
}
