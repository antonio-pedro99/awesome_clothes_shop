import 'package:awesome_clother_shop/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  final List<CartProduct> _products = [];
  double total = 0.0;

  int itemQuantityStart = 1;
  int itemSizeIndexStart = 0;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    if (_products.isNotEmpty) {
      _products.map((e) {
        total = total + e.price!;
      });
    }
    notifyListeners();
  }

  void add(CartProduct product) {
    if (!isInCar(product.productName!)) {
      _products.add(product);
    }
    notifyListeners();
  }

  void remove(CartProduct product) {}

  void incrementProductQuantity(CartProduct cartProduct) {
    notifyListeners();
  }

  void decrementProductQuantity(CartProduct cartProduct) {
    notifyListeners();
  }

  bool isEmpty() {
    return _products.isEmpty;
  }

  int get itemsCount => _products.length;
  List<CartProduct> get products => _products;
  double get getTotal {
    total = _products.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.price! * element.quantity!));
    return total;
  }

  void clear() {
    _products.clear();
    notifyListeners();
  }

  String productByItsName(String name) =>
      _products[_products.indexWhere((element) => element.productName == name)]
          .productName!;

  bool isInCar(String name) {
    return _products.any((element) => element.productName == name);
  }
}
