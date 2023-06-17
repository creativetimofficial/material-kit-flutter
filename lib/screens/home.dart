import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';

//widgets
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/card-horizontal.dart';
import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/card-square.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Hardly Anything Takes More Coura...",
    "image":
        "https://images.unsplash.com/photo-1539314171919-908b0cd96f03?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  },
  "Makeup": {
    "title": "Find the cheapest deals on our range...",
    "image":
        "https://images.unsplash.com/photo-1515709980177-7a7d628c09ba?crop=entropy&w=840&h=840&fit=crop",
    "price": "220"
  },
  "Coffee": {
    "title": "Looking for Men's watches?",
    "image":
        "https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?crop=entropy&w=840&h=840&fit=crop",
    "price": "40"
  },
  "Fashion": {
    "title": "Curious Blossom Skin Care Kit.",
    "image":
        "https://images.unsplash.com/photo-1536303006682-2ee36ba49592?crop=entropy&w=840&h=840&fit=crop",
    "price": "188"
  },
  "Argon": {
    "title": "Adjust your watch to your outfit.",
    "image":
        "https://images.unsplash.com/photo-1491336477066-31156b5e4f35?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  }
};

class Home extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Home",
          searchBar: true,
          categoryOne: "Categories",
          categoryTwo: "Best Deals",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal(
                      cta: "View article",
                      title: homeCards["Ice Cream"]!['title']!,
                      img: homeCards["Ice Cream"]!['image']!,
                      tap: () {
                        Navigator.pushReplacementNamed(context, '/pro');
                      }),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        cta: "View article",
                        title: homeCards["Makeup"]!['title']!,
                        img: homeCards["Makeup"]!['image']!,
                        tap: () {
                          Navigator.pushReplacementNamed(context, '/pro');
                        }),
                    CardSmall(
                        cta: "View article",
                        title: homeCards["Coffee"]!['title']!,
                        img: homeCards["Coffee"]!['image']!,
                        tap: () {
                          Navigator.pushReplacementNamed(context, '/pro');
                        })
                  ],
                ),
                SizedBox(height: 8.0),
                CardHorizontal(
                    cta: "View article",
                    title: homeCards["Fashion"]!['title']!,
                    img: homeCards["Fashion"]!['image']!,
                    tap: () {
                      Navigator.pushReplacementNamed(context, '/pro');
                    }),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: CardSquare(
                      cta: "View article",
                      title: homeCards["Argon"]!['title']!,
                      img: homeCards["Argon"]!['image']!,
                      tap: () {
                        Navigator.pushReplacementNamed(context, '/pro');
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
