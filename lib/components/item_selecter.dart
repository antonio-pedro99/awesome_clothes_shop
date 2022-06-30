import 'package:flutter/material.dart';

class ItemSelecter extends StatelessWidget {
  const ItemSelecter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white), shape: BoxShape.circle),
        child: const Icon(
          Icons.remove_outlined,
          color: Colors.white,
        ),
      ),
      title: const Center(
          child:
              Text("1", style: TextStyle(fontSize: 28, color: Colors.white))),
      trailing: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white), shape: BoxShape.circle),
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
