import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List<Product> _products = [];
  double total = 0.0;

  @override
  void addListener(VoidCallback listener) {
    if (_products.isNotEmpty) {
      _products.map((e) {
        total = total + e.price!;
      });
    }
    super.addListener(listener);
  }

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
