import 'package:flutter/cupertino.dart';

class Collection {
  String? imageUrl;
  String? collectionName;
  Color? color;

  Collection({this.collectionName, this.color, this.imageUrl});
  List<Product>? products;

  static List<Collection> colletions() {
    var items = <Collection>[
      Collection(
          color: const Color.fromRGBO(255, 228, 130, 1),
          collectionName: "Children",
          imageUrl:
              "https://o.remove.bg/downloads/994967f5-9cf2-4e26-9072-a908a79eb336/photo-1563773617060-f29607ce70a1-removebg-preview.png"),
      Collection(
          color: const Color.fromRGBO(171, 210, 176, 1),
          collectionName: "Men",
          imageUrl:
              "https://o.remove.bg/downloads/0868a269-7d41-43e6-b6bc-e3eb411b8228/photo-1487222477894-8943e31ef7b2-removebg-preview.png"),
      Collection(
          color: const Color.fromRGBO(214, 182, 240, 1),
          collectionName: "Women",
          imageUrl:
              "https://o.remove.bg/downloads/a67fc80a-8c3f-4ebd-bfdb-2d0288a7e519/photo-1561316004-7e33d75d2e69-removebg-preview.png")
    ];

    return items;
  }
}

class Product {
  String? imageUrl;
  String? productName;
  Color? color;
}
