import 'dart:ui';

import 'package:awesome_clother_shop/models/cart.dart';
import 'package:awesome_clother_shop/models/product.dart';
import 'package:awesome_clother_shop/providers/cart.dart';
import 'package:awesome_clother_shop/views/components/beautful_button.dart';
import 'package:awesome_clother_shop/views/components/item_selecter.dart';
import 'package:awesome_clother_shop/views/components/size_selecter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const _maxHeight = 260.0;
const _minHeight = 70.0;

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _animationStopped = true;
  bool _productInCar = false;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _productInCar = Provider.of<CartModel>(context, listen: false)
        .isInCar(widget.product!.productName!);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var buttonSize = size.width * .5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: Colors.black87,
                      ))
                ],
              )
            ];
          }),
          body: _buildBody(widget.product!, size)),
      extendBody: true,
      bottomNavigationBar: AnimatedBuilder(
          animation: animationController,
          builder: (context, snapshot) {
            var value = animationController.value;
            return Stack(
              children: [
                Positioned(
                  height: lerpDouble(_minHeight, _maxHeight, value),
                  bottom: lerpDouble(15, 0, value),
                  left: lerpDouble(size.width / 2 - buttonSize / 2, 0, value),
                  width: lerpDouble(buttonSize, size.width, value),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.vertical(
                            top: const Radius.circular(25),
                            bottom:
                                Radius.circular(lerpDouble(25, 0, value)!))),
                    child: (!_animationStopped)
                        ? _myAnimatedBottomSheet(context, size, () {
                            setState(() {
                              _animationStopped = true;
                            });
                            animationController.reverse();
                            CartProduct _product =
                                CartProduct(quantity: 1, size: "M");
                            _product.price = widget.product!.price;
                            _product.productName = widget.product!.productName;
                            _product.description = widget.product!.description;
                            _product.imageUrl = widget.product!.imageUrl;
                            _product.color = widget.product!.color;
                            Provider.of<CartModel>(context, listen: false)
                                .add(_product);
                          })
                        : Center(
                            child: GestureDetector(
                              child: Text(
                                  _productInCar ? "Customize" : "Move to Cart",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.tajawal(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              onTap: () {
                                setState(() {
                                  _animationStopped = false;
                                });
                                animationController.forward();
                              },
                            ),
                          ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

Widget _buildBody(Product product, Size size) {
  return ListView(
    padding: const EdgeInsets.all(10),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Hero(
        tag: product,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: size.width,
          height: size.height * .6,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(171, 210, 176, 1),
              borderRadius: BorderRadius.circular(25)),
          child: Image.asset("assets/photos/${product.imageUrl!}"),
        ),
      ),
      const SizedBox(height: 10),
      bottom(size, product)
    ],
  );
}

Widget bottom(Size size, Product product) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Item",
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  const SizedBox(width: 2),
                  Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black),
                    child: const Text("1",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
            Text("\$ ${product.price!.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Size",
                      style: TextStyle(fontWeight: FontWeight.w400)),
                  const SizedBox(width: 2),
                  Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black),
                    child: const Text("M",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text("Details",
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 5),
        LimitedBox(
          maxWidth: size.width * .46,
          child: Text(
            product.description!,
            maxLines: 5,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.black45,
                fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget _myAnimatedBottomSheet(
    BuildContext context, Size size, VoidCallback action) {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(
      size.height * .02,
    ),
    children: [
      const Center(
          child: Text(
        "Quantity",
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
      const ItemSelecter(),
      const Center(
        child: Text(
          "Select Your Size",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      const SizeSelecter(),
      const SizedBox(height: 10),
      BeautfulButton(label: "Save", reversed: true, onPress: action)
    ],
  );
}
