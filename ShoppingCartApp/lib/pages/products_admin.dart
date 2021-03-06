import 'package:flutter/material.dart';
// import '../product_manager.dart';
import './product_edit.dart';
import './product_list.dart';
// import './products.dart';

class ProductsAdminPage extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;
  final List<Map<String, dynamic>> products;

  ProductsAdminPage(this.addProduct,this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context){
    return Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Choose'),
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('All Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text('Manage Products'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Products',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(
              children: <Widget>[
                  ProductEditPage(addProduct: addProduct),
                  ProductListPage(products, updateProduct, deleteProduct)
              ],
            ),
          ),
        ));
  }
}
