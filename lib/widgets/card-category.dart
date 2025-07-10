import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  CardCategory(
      {this.title = "Placeholder Title",
      this.img = "https://via.placeholder.com/250",
      this.tap = defaultFunc});

  final String img;
  final VoidCallback? tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 252,
        width: null,
        child: GestureDetector(
          onTap: tap,
          child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ))),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)))),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0)),
                    ),
                  ),
                )
              ])),
        ));
  }
}
