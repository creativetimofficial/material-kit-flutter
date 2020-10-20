import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        margin: EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: tap,
          child: Stack(overflow: Overflow.clip, children: [
            Card(
              elevation: 0.7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Row(
                children: [
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: TextStyle(
                                    color: MaterialColors.caption,
                                    fontSize: 13)),
                            Text(cta,
                                style: TextStyle(
                                    color: MaterialColors.muted,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ))
                ],
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.04, -0.08),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.all(4.0),
                    height: MediaQuery.of(context).size.height / 2,
                    width: 165,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        image: DecorationImage(
                            image: NetworkImage(img), fit: BoxFit.cover))),
              ),
            ),
          ]),
        ));
  }
}
