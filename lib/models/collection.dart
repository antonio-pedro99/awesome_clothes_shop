import 'dart:math';

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
                productName: "Kids Lorem Ifum it is kunt what",
                price: 255.90,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k1.png"),
            Product(
                productName: "Kids Lorem Ipdfum it is kunt what",
                price: 356.00,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k2.png"),
            Product(
                productName: "Kids Lorem Ipsum it is kunt hat.",
                price: 1200.00,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k3.png"),
            Product(
                productName: "Kids Loem Ipsum it is kunt whad.",
                price: 1000,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k4.png"),
            Product(
                productName: "Kids Lorem Ipsudf it is kunt what",
                price: 500.00,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k5.png"),
            Product(
                productName: "Kids Ldrem Ipsum it is kunt what",
                price: 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "k6.png"),
          ]),
      Collection(
          color: const Color.fromRGBO(171, 210, 176, 1),
          secundary: const Color.fromRGBO(247, 253, 247, 1),
          collectionName: "Men",
          imageUrl: "men.png",
          products: <Product>[
            Product(
                productName: "Men Lorem Ipsdum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m3.png"),
            Product(
                productName: "Men Lorem Iwesum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m4.png"),
            Product(
                productName: "Men Lorem Ipsrem it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m5.png"),
            Product(
                productName: "Men Lorm Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m6.png"),
            Product(
                productName: "Men Lem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m7.png"),
            Product(
                productName: "Men Lorem pIsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m8.png"),
            Product(
                productName: "Men Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m9.png"),
            Product(
                productName: "Men Lorem sDpsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m10.png"),
            Product(
                productName: "Men Lorem Ifdum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m11.png"),
            Product(
                productName: "Men Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m2.png"),
            Product(
                productName: "Men Lorem IpsDskm it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "m1.png"),
          ]),
      Collection(
          color: const Color.fromRGBO(214, 182, 240, 1),
          secundary: const Color.fromRGBO(250, 247, 253, 1),
          collectionName: "Women",
          imageUrl: "woman.png",
          products: <Product>[
            Product(
                productName: "Girls Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g3.png"),
            Product(
                productName: "Girls Lorem it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g4.png"),
            Product(
                productName: "Girls Lorem Ipsum it what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g5.png"),
            Product(
                productName: "Girls Lorem Ipsds is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g6.png"),
            Product(
                productName: "Girl Lorem Ipsum fake it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g7.png"),
            Product(
                productName: "Girl Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g8.png"),
            Product(
                productName: "Girls Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g9.png"),
            Product(
                productName: "Woman Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g10.png"),
            Product(
                productName: "Wonderfull Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g2.png"),
            Product(
                productName: "Girls 4 Lorem Ipsum it is kunt what",
                price: (Random().nextDouble() * 1000) + 200.0,
                description:
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                imageUrl: "g1.png"),
          ])
    ];

    return items;
  }
}
