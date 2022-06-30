import 'package:awesome_clother_shop/components/item_selecter.dart';
import 'package:awesome_clother_shop/components/size_selecter.dart';
import 'package:flutter/material.dart';

class AddToCartTile extends StatelessWidget {
  const AddToCartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(
          top: size.height * .04,
          left: size.height * .02,
          right: size.height * .02),
      children: const [
        Center(
            child: Text(
          "Quantity",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        ItemSelecter(),
        Center(
          child: Text(
            "Select Your Size",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizeSelecter()
      ],
    );
  }
}
