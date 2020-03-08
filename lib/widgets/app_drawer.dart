import 'package:flutter/material.dart';
import 'package:harvestcustmer/Screens/seting%20screen.dart';
import 'package:harvestcustmer/Screens/settings_account_screen.dart';
import '../Screens/cart_screen.dart';
import '../providers/auth.dart';
import '../Screens/user_products_screen.dart';
import 'package:provider/provider.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('مرحبا بالعملاء '),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,),
          Divider(),
          ListTile(leading: Icon(Icons.shop),
          title: Text('المنتجات'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed("/");

          },),
          Divider(),
          ListTile(leading: Icon(Icons.payment),
            title: Text('المتطلبات'),
            onTap: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
              //Navigator.of(context).pushReplacement (CustomRoute(builder: (ctx)=>OrderScreen(),));
            },),
//          Divider(),
//          ListTile(leading: Icon(Icons.edit),
//            title: Text('ادارة المنتجات'),
//            onTap: (){
//              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
//
//            },),
          Divider(),
          ListTile(leading: Icon(Icons.person),
            title: Text('  الملف الشخصي'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new  SettingsAccountScreen()));
            },),

          ListTile(leading: Icon(Icons.settings),
            title: Text('الاعدادات'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new  seteing_screen()));
            },),

          Divider(),
          ListTile(leading: Icon(Icons.exit_to_app),
            title: Text('تسجيل الخروج'),
            onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
           //   Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context,listen: false).logout();

            },)
        ],
      ),
    );
  }
}
