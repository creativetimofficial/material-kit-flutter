import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
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
    return Flexible(
        child: Container(
      height: 235,
      margin: EdgeInsets.only(top: 10),
      child: GestureDetector(
          onTap: tap,
          child: Stack(overflow: Overflow.clip, children: [
            Card(
                elevation: 0.7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 2, child: Container()),
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: TextStyle(
                                      color: MaterialColors.caption,
                                      fontSize: 13)),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(cta,
                                    style: TextStyle(
                                        color: MaterialColors.muted,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
            FractionalTranslation(
                translation: Offset(0, -0.04),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.185,
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            )))))
          ])),
    ));
  }
}
