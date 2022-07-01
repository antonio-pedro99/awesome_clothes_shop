import 'package:awesome_clother_shop/components/beautful_button.dart';
import 'package:awesome_clother_shop/components/item_selecter.dart';
import 'package:awesome_clother_shop/components/size_selecter.dart';
import 'package:flutter/material.dart';

class AddToCartTile extends StatelessWidget {
  const AddToCartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(
        size.height * .02,
      ),
      children: [
        const Center(
            child: Text(
          "Quantity",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
        const ItemSelecter(),
        const Center(
          child: Text(
            "Select Your Size",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        const SizeSelecter(),
        const SizedBox(height: 10),
        BeautfulButton(
          label: "Save",
          reversed: true,
          onPress: () {},
        )
      ],
    );
  }
}
