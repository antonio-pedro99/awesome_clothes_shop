import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';

class Collection {
  String? imageUrl;
  String? collectionName;
  Color? color, secundary;

  Collection(
      {this.collectionName,
      this.color,
      this.imageUrl,
      this.secundary,
      this.products});
  List<Product>? products;

  static List<Collection> colletions() {
    var items = <Collection>[
      Collection(
          color: const Color.fromRGBO(255, 228, 130, 1),
          secundary: const Color.fromRGBO(255, 252, 239, 1),
          collectionName: "Children",
          imageUrl: "children.png",
          products: <Product>[
            Product(
                productName: "",
                price: 89.0.toStringAsPrecision(2),
                description: "",
                imageUrl: "")
          ]),
      Collection(
          color: const Color.fromRGBO(171, 210, 176, 1),
          secundary: const Color.fromRGBO(247, 253, 247, 1),
          collectionName: "Men",
          imageUrl: "men.png"),
      Collection(
          color: const Color.fromRGBO(214, 182, 240, 1),
          secundary: const Color.fromRGBO(250, 247, 253, 1),
          collectionName: "Women",
          imageUrl: "woman.png")
    ];

    return items;
  }
}
