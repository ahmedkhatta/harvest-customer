import 'package:flutter/material.dart';
import 'package:harvestcustmer/Screens/edit_product_screen.dart';
import 'package:harvestcustmer/widgets/mazad.dart';

import '../providers/products.dart';
import 'package:provider/provider.dart';

import 'mazad_screen.dart';

class ProductDetailsScreen extends StatelessWidget {

  static const routName = '/product-detail';


  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
//      appBar: AppBar(
//        title: Text(loadedProduct.title),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title:Text(loadedProduct.title, textAlign: TextAlign.center,),

            background:Hero(
              tag: loadedProduct.id,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ) ,),
          ),
          SliverList(delegate: SliverChildListDelegate
            ([
            SizedBox(
              height: 10.0,
            ),
            Text(
              "\$SR{loadedProduct.price}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),



            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(height: 15.0),
            Container(
                height: 50.0,
                width: 280.0,
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(

                    onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => new UserProductsScreenMazad()));
                },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.directions,
                          color: Colors.white,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 90.0),
                            child: Text(
                              'منتجات المزاد',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat'),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),

            SizedBox(height: 800.0,)
          ])
          ),
        ],
       ),
    );
  }
}
