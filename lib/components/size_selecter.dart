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
    int _currentSize = 0;
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          setState(() {
            _currentSize -= 1;
          });
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: const Icon(
            Icons.remove_outlined,
            color: Colors.white,
          ),
        ),
      ),
      title: Center(
          child: Text(sizes[_currentSize],
              style: const TextStyle(fontSize: 28, color: Colors.white))),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            _currentSize++;
          });
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
