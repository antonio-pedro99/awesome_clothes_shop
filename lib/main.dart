import 'dart:math';

import 'package:awesome_clother_shop/collection_tile.dart';
import 'package:awesome_clother_shop/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

const List<Color> _colors = [
  Color.fromRGBO(255, 228, 130, 1),
  Color.fromRGBO(171, 210, 176, 1),
  Color.fromRGBO(214, 182, 240, 1)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Clothes Shop',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.grey),
      home: const MyHomePage(title: 'Collection'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
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
                  Scaffold.of(context).showBottomSheet((context) {
                    return const SingleChildScrollView();
                  });
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
