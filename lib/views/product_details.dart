import 'dart:ui';

import 'package:awesome_clother_shop/components/add_to_cart_tile.dart';
import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _maxHeight = 250.0;
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

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
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
            body: ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Hero(
                  tag: widget.product!,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: size.width,
                    height: size.height * .6,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(171, 210, 176, 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                        "assets/photos/${widget.product!.imageUrl!}"),
                  ),
                ),
                const SizedBox(height: 10),
                bottom(size, widget.product!)
              ],
            )),
        extendBody: true,
        bottomNavigationBar: GestureDetector(
          onTap: () {
            setState(() {
              _animationStopped = !_animationStopped;
            });

            if (_animationStopped) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
          child: AnimatedBuilder(
              animation: animationController,
              builder: (context, snapshot) {
                var value = animationController.value;
                return Stack(
                  children: [
                    Positioned(
                      height: lerpDouble(_minHeight, _maxHeight, value),
                      bottom: lerpDouble(15, 0, value),
                      left:
                          lerpDouble(size.width / 2 - buttonSize / 2, 0, value),
                      width: lerpDouble(buttonSize, size.width, value),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.vertical(
                                top: const Radius.circular(25),
                                bottom: Radius.circular(
                                    lerpDouble(25, 0, value)!))),
                        child: (!_animationStopped)
                            ? const AddToCartTile()
                            : Center(
                                child: Text("Move to Cart",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.tajawal(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
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
            Text("\$ ${product.price!}",
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

Widget _bottomNavigationBar() {
  return Container();
}
