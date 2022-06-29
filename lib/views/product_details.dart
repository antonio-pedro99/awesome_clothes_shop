import 'package:awesome_clother_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, this.product}) : super(key: key);

  final Product? product;
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
                expandedHeight: 100,
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
                tag: product!.productName!,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: size.width,
                  height: size.height * .6,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(171, 210, 176, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset("assets/photos/${product!.imageUrl!}"),
                ),
              ),
              const SizedBox(height: 10),
              bottom(size, product!)
            ],
          )),
      extendBody: true,
      bottomNavigationBar: buyButton(size),
    );
  }
}

Widget buyButton(Size size) {
  return Stack(children: [
    Positioned(
        bottom: 15,
        height: 70,
        left: size.width * 0.23,
        child: Container(
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25)),
            child: Text("Move to Cart",
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400))))
  ]);
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
