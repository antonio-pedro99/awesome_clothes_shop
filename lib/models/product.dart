import 'package:flutter/material.dart';

class Product {
  String? imageUrl;
  String? productName, description;
  Color? color;
  String? price;

  Product(
      {this.productName,
      this.color,
      this.imageUrl,
      this.description,
      this.price});
}
