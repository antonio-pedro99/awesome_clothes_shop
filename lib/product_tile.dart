import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: size.width * .7,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(171, 210, 176, 1),
              borderRadius: BorderRadius.circular(25)),
          child: Image.network(
              "https://o.remove.bg/downloads/3f0bdb50-9c26-4c98-bcfb-85abb097f3ec/photo-1618554754947-e01d5ce3c549-removebg-preview.png"),
        ),
        const SizedBox(height: 15),
        const Text(
          "\$ 345",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(height: 5),
        LimitedBox(
          maxWidth: size.width * .7,
          child: const Text(
            "Product Name will be here My Name is Antonio",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
