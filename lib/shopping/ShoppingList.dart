import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/shopping/ShoppingListItem.dart';

class ShoppingList extends StatefulWidget{
  static Widget getShoppingList(){
    return new ShoppingList(products: <Product>[
      new Product(name: 'Eggs'),
      new Product(name: 'Flour'),
      new Product(name: 'Chocolate chips'),
    ]);
  }
  ShoppingList({Key key, this.products}): super(key: key);
  final List<Product> products;
  @override
  State<StatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart){
    setState(() {
      if(inCart){
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Shopping List'),),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ShoppingListItem(product: product, inCart: _shoppingCart.contains(product),onCartChanged: _handleCartChanged);
        }).toList()
      ),
    );
  }
}