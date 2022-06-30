import 'dart:math';

import 'package:awesome_clother_shop/components/product_cart_tile.dart';
import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text("Cart"),
                centerTitle: true,
                forceElevated: innerBoxIsScrolled,
              )
            ];
          }),
          body: ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png")),
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png")),
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png")),
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png")),
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png")),
              ProductInCartTile(
                  product: Product(
                      productName: "Kids Lorem Ipsum it is kunt what",
                      price: ((Random().nextDouble() * 1000) + 200.0)
                          .toStringAsFixed(2),
                      description:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                      imageUrl: "k1.png"))
            ],
          )),
      extendBody: true,
      bottomNavigationBar: Stack(
        children: [
          Positioned(
              height: size.height * .30,
              width: size.width,
              bottom: 0,
              child: Container(color: Colors.red))
        ],
      ),
    );
  }
}
