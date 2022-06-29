import 'package:awesome_clother_shop/models.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  const CollectionTile({Key? key, this.collection}) : super(key: key);

  final Collection? collection;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 215,
      decoration: BoxDecoration(
          color: collection!.color, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          Image.asset("assets/collections/${collection!.imageUrl!}"),
          Positioned(
              bottom: 15,
              right: 25,
              height: 50,
              child: Stack(alignment: Alignment.center, children: [
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.white.withOpacity(0.3)
                          ],
                          stops: const [
                            0.0,
                            0.1
                          ]),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25))
                      ],
                    ),
                  ),
                ),
                Text(
                  collection!.collectionName!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ]))
        ],
      ),
    );
  }
}
