
import 'dart:math';

import 'package:awesome_clother_shop/components/collection_tile.dart';
import 'package:awesome_clother_shop/models/collection.dart';
import 'package:awesome_clother_shop/models/product.dart';
import 'package:awesome_clother_shop/views/product_details.dart';
import 'package:awesome_clother_shop/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const List<Color> _colors = [
  Color.fromRGBO(255, 228, 130, 1),
  Color.fromRGBO(171, 210, 176, 1),
  Color.fromRGBO(214, 182, 240, 1)
];

class _MyHomePageState extends State<MyHomePage> {
  Color? getColor() {
    return _colors[Random().nextInt(_colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.black87,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: Collection.colletions().length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Hero(
                    tag: "box",
                    child: CollectionTile(
                        collection: Collection.colletions()[index])),
                onTap: () {
                  openBottomSheet(context, Collection.colletions()[index]);
                },
              );
            }),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.search_outlined, size: 30, color: Colors.white),
      ),
    );
  }
}

Product _product = Product(
    productName: "It is a long established fact that.",
    price: ((Random().nextDouble() * 1000) + 200.0).toStringAsFixed(2),
    description:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
    imageUrl: "photo1.png");

void openBottomSheet(BuildContext context, Collection collection) {
  var size = MediaQuery.of(context).size;
  showModalBottomSheet(
      constraints:
          BoxConstraints(maxHeight: size.height * .88, minWidth: size.width),
      backgroundColor:
          collection.secundary, //const Color.fromRGBO(248, 247, 243, 1),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      elevation: 3,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 8.0),
            child: Column(
              children: [
                Text(
                  "${collection.collectionName}'s Collection",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 20),
                ),
                const SizedBox(height: 35),
                Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ProductDetails(product: _product);
                                }));
                              },
                              child: ProductTile(
                                product: _product,
                              ));
                        }))
              ],
            ));
      });
}