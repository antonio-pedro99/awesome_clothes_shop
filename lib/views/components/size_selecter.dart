import 'package:flutter/material.dart';

class SizeSelecter extends StatefulWidget {
  const SizeSelecter({Key? key}) : super(key: key);

  @override
  State<SizeSelecter> createState() => _SizeSelecterState();
}

class _SizeSelecterState extends State<SizeSelecter> {
  @override
  Widget build(BuildContext context) {
    var sizes = ["S", "M", "L", "L", "LL", "XL", "LL", "XL", "LL", "XL"];
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: const Icon(
            Icons.remove_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      title: Center(
          child: Text(sizes[0],
              style: const TextStyle(fontSize: 24, color: Colors.white))),
      trailing: GestureDetector(
        onTap: () {},
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
