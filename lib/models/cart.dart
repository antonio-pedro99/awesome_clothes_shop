import 'package:awesome_clother_shop/models/product.dart';

class CartProduct extends Product {
  int? quantity;
  String? size;

  CartProduct({this.quantity, this.size});

}
