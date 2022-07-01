import 'package:awesome_clother_shop/components/beautful_button.dart';
import 'package:awesome_clother_shop/components/product_cart_tile.dart';
import 'package:awesome_clother_shop/models/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CartModel>(
      builder: (context, cart, child) {
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
                body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: !cart.isEmpty()
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: cart.itemsCount,
                            itemBuilder: (context, index) {
                              return ProductInCartTile(
                                  cartProduct: cart.products[index]);
                            })
                        : Center(
                            child: Text(
                              "Cart is Empty",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ))),
            extendBody: true,
            bottomNavigationBar: !cart.isEmpty()
                ? _bottomNavigator(context, size, cart)
                : Container());
      },
    );
  }
}

Widget _bottomNavigator(BuildContext context, Size size, CartModel model) {
  return Stack(
    children: [
      Positioned(
          height: size.height * .25,
          width: size.width,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
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
                        Text(
                          "\$${model.getTotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        )
                      ],
                    ),
                    BeautfulButton(
                      label: "Buy Now",
                      onPress: () {},
                    )
                  ],
                )
              ],
            ),
          ))
    ],
  );
}
