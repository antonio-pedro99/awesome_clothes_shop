import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, this.product}) : super(key: key);

  final Product? product;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: size.width * .7,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(171, 210, 176, 1),
              borderRadius: BorderRadius.circular(25)),
          child: Image.asset("assets/photos/${product!.imageUrl}"),
        ),
        const SizedBox(height: 15),
        Text(
          "\$${product!.price}",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(height: 5),
        LimitedBox(
          maxWidth: size.width * .46,
          child: Text(
            product!.productName!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
