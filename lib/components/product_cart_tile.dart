import 'package:awesome_clother_shop/models/cart.dart';
import 'package:flutter/material.dart';

class ProductInCartTile extends StatelessWidget {
  const ProductInCartTile({Key? key, this.cartProduct}) : super(key: key);

  final CartProduct? cartProduct;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(248, 247, 243, 1),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCartProductImage(cartProduct),
          const SizedBox(width: 15),
          Flexible(child: _buildCartProductDetails(cartProduct)),
          _buildQuantitySelector(cartProduct)
        ],
      ),
    );
  }
}

Widget _buildCartProductImage(CartProduct? cartProduct) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(171, 210, 176, 1),
        borderRadius: BorderRadius.circular(25)),
    child: Image.asset("assets/photos/${cartProduct!.imageUrl}"),
  );
}

Widget _buildCartProductDetails(CartProduct? cartProduct) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${cartProduct!.productName}",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 8),
      Text(
        "\$${cartProduct.price!.toStringAsFixed(2)}",
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
      ),
    ],
  );
}

Widget _buildQuantitySelector(CartProduct? cartProduct) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
            size: 20,
          )),
      Text(
        "${cartProduct!.quantity}",
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 20))
    ],
  );
}
