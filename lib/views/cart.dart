import 'dart:math';

import 'package:awesome_clother_shop/components/product_cart_tile.dart';
import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              ],
            )),
        extendBody: true,
        bottomNavigationBar: _bottomNavigator(context, size));
  }
}

Widget _bottomNavigator(BuildContext context, Size size) {
  return Stack(
    children: [
      Positioned(
          height: size.height * .25,
          width: size.width,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15, right: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey, width: 0.4))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        const Text(
                          "\$345.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                    buttonBuy()
                  ],
                )
              ],
            ),
          ))
    ],
  );
}

Widget buttonBuy() {
  return Container(
      height: 65,
      width: 165,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text("Pay Now",
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400))));
}
