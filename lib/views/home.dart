import 'package:awesome_clother_shop/components/collection_tile.dart';
import 'package:awesome_clother_shop/models/collection.dart';
import 'package:awesome_clother_shop/views/cart.dart';
import 'package:awesome_clother_shop/views/product_details.dart';
import 'package:awesome_clother_shop/components/product_tile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
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
                child:
                    CollectionTile(collection: Collection.colletions()[index]),
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
                              child: ProductTile(
                                product: collection.products![index],
                              ));
                        }))
              ],
            ));
      });
}
