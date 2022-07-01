import 'dart:math' as math;
import 'package:awesome_clother_shop/components/collection_tile.dart';
import 'package:awesome_clother_shop/models/collection.dart';
import 'package:awesome_clother_shop/models/providers/cart.dart';
import 'package:awesome_clother_shop/views/cart.dart';
import 'package:awesome_clother_shop/views/product_details.dart';
import 'package:awesome_clother_shop/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController;

  double offset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: .5);

    pageController.addListener(() => setState(() {
          offset = pageController.page!;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CartPage();
                    }));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                    color: Colors.black87,
                  )),
              Consumer<CartModel>(builder: (context, cart, child) {
                return !cart.isEmpty()
                    ? Positioned(
                        height: 18,
                        width: 18,
                        right: 25,
                        top: 15,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black),
                          child: Text("${cart.itemsCount}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white)),
                        ))
                    : Container();
              })
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ListView.builder(
            itemCount: Collection.colletions().length,
            itemBuilder: (context, index) {
              return InkWell(
                child:
                    CollectionTile(collection: Collection.colletions()[index]),
                onTap: () {
                  openBottomSheet(context, Collection.colletions()[index],
                      pageController, offset);
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

void openBottomSheet(BuildContext context, Collection collection,
    PageController controller, double scrollOffset) {
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
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Text(
                "${collection.collectionName}'s Collection",
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              const SizedBox(height: 24),
              /*  PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: collection.products!.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment(
                          0,
                          math.exp(-math.pow(scrollOffset - index, -4) /
                              collection.products!.length)),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetails(
                                  product: collection.products![index]);
                            }));
                          },
                          child: Container(
                            height: 400,
                            width: 400,
                            margin: const EdgeInsets.only(left: 8),
                            color: Colors.primaries[index],
                          )),
                    );
                  }) */

              Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: collection.products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetails(
                                  product: collection.products![index]);
                            }));
                          },
                          child: Align(
                            alignment: const Alignment(0, 1),
                            child: ProductTile(
                              product: collection.products![index],
                            ),
                          ));
                    }),
              )
            ],
          ),
        );
      });
}
