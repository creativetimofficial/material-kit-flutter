import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

class PhotoAlbum extends StatelessWidget {
  final List<String> imgArray;

  PhotoAlbum({@required this.imgArray});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recently viewed",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(color: MaterialColors.primary, fontSize: 12.0),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: GridView.count(
              primary: false,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: imgArray
                  .map((item) => Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          image: DecorationImage(
                              image: NetworkImage(item), fit: BoxFit.cover))))
                  .toList()),
        )
      ],
    );
  }
}
