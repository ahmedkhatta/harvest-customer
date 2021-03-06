import 'package:flutter/material.dart';
import 'package:harvestcustmer/widgets/mazad.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_products_item.dart';
import '../widgets/app_drawer.dart';
import 'edit_product_screen.dart';

class UserProductsScreenMazad extends StatelessWidget {
  static const routeName = '/user-products';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    print("تحديث .........");
    return Scaffold(
        appBar: AppBar(
          title: const Text('منتجات المزاد'),
          backgroundColor: Colors.green,

        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
            child: CircularProgressIndicator(),
          )
              : RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: Consumer<Products>(

              builder:(ctx,productsData,_)=> Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: productsData.items.length,
                    itemBuilder: (_, i) => Column(children: [
                      UserProductItemMazad(
                        productsData.items[i].id,
                        productsData.items[i].title,
                        productsData.items[i].imageUrl,
                      ),
                      Divider(),
                    ]),
                  )),
            ),
          ),
        ));
  }
}
