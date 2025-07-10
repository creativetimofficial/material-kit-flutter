import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

// import 'package:material_kit_flutter/screens/categories.dart';
// import 'package:material_kit_flutter/screens/best-deals.dart';
// import 'package:material_kit_flutter/screens/search.dart';
// import 'package:material_kit_flutter/screens/cart.dart';
// import 'package:material_kit_flutter/screens/chat.dart';

import 'package:material_kit_flutter/widgets/input.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final TextEditingController searchController;
  final VoidCallback? getCurrentPage;
  final bool isOnSearch;
  final ValueChanged<String>? searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  Navbar({
    this.title = "Home",
    this.categoryOne = "",
    this.categoryTwo = "",
    required this.tags,
    this.transparent = false,
    this.rightOptions = true,
    this.getCurrentPage,
    required this.searchController,
    this.isOnSearch = false,
    this.searchOnChanged,
    this.searchAutofocus = false,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = Colors.white,
    this.searchBar = false,
  });

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag = '';

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    if (widget.tags.isNotEmpty) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final bool tagsExist = widget.tags.isNotEmpty;

    return Container(
        height: widget.searchBar
            ? (!categories
                ? (tagsExist ? 211.0 : 178.0)
                : (tagsExist ? 262.0 : 210.0))
            : (!categories
                ? (tagsExist ? 132.0 : 102.0)
                : (tagsExist ? 200.0 : 150.0)),
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? Colors.black.withValues(alpha: 0.6)
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                  !widget.backButton
                                      ? Icons.menu
                                      : Icons.arrow_back_ios,
                                  color: !widget.transparent
                                      ? (widget.bgColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)
                                      : Colors.white,
                                  size: 24.0),
                              onPressed: () {
                                if (!widget.backButton)
                                  Scaffold.of(context).openDrawer();
                                else
                                  Navigator.pop(context);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(widget.title,
                                style: TextStyle(
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0)),
                          ),
                        ],
                      ),
                      if (widget.rightOptions)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Chat()));
                              },
                              child: IconButton(
                                  icon: Icon(Icons.chat_bubble_outline,
                                      color: !widget.transparent
                                          ? (widget.bgColor == Colors.white
                                              ? Colors.black
                                              : Colors.white)
                                          : Colors.white,
                                      size: 22.0),
                                  onPressed: null),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Cart()));
                              },
                              child: IconButton(
                                  icon: Icon(Icons.add_shopping_cart,
                                      color: !widget.transparent
                                          ? (widget.bgColor == Colors.white
                                              ? Colors.black
                                              : Colors.white)
                                          : Colors.white,
                                      size: 22.0),
                                  onPressed: null),
                            ),
                          ],
                        )
                    ],
                  ),
                  if (widget.searchBar)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 4, left: 15, right: 15),
                      child: Input(
                          placeholder: "What are you looking for?",
                          controller: widget.searchController,
                          onChanged: widget.searchOnChanged,
                          autofocus: widget.searchAutofocus,
                          outlineBorder: true,
                          enabledBorderColor: Colors.black.withValues(alpha: 0.2),
                          focusedBorderColor: MaterialColors.muted,
                          suffixIcon:
                              Icon(Icons.zoom_in, color: MaterialColors.muted),
                          onTap: () {
                            // if (!widget.isOnSearch)
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Search()));
                          }),
                    ),
                  SizedBox(
                    height: tagsExist ? 0 : 10,
                  ),
                  if (categories)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Categories()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.border_all,
                                  color: Colors.black87, size: 22.0),
                              SizedBox(width: 10),
                              Text(widget.categoryOne,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16.0)),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          color: MaterialColors.muted,
                          height: 25,
                          width: 0.3,
                        ),
                        SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BestDeals()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.camera_enhance,
                                  color: Colors.black87, size: 22.0),
                              SizedBox(width: 10),
                              Text(widget.categoryTwo,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16.0)),
                            ],
                          ),
                        )
                      ],
                    ),
                  if (tagsExist)
                    Container(
                      height: 40,
                      child: ScrollablePositionedList.builder(
                        shrinkWrap: true,
                        itemScrollController: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.tags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (activeTag != widget.tags[index]) {
                                setState(() => activeTag = widget.tags[index]);
                                _scrollController.scrollTo(
                                    index:
                                        index == widget.tags.length - 1 ? 1 : 0,
                                    duration: Duration(milliseconds: 420),
                                    curve: Curves.easeIn);
                                if (widget.getCurrentPage != null)
                                  widget.getCurrentPage!();
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 46 : 8, right: 8),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2.0,
                                            color: activeTag == widget.tags[index]
                                                ? MaterialColors.primary
                                                : Colors.transparent))),
                                child: Center(
                                  child: Text(widget.tags[index],
                                      style: TextStyle(
                                          color: activeTag == widget.tags[index]
                                              ? MaterialColors.primary
                                              : MaterialColors.placeholder,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0)),
                                )),
                          );
                        },
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
