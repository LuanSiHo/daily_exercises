import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
        child: TextField(
            decoration: InputDecoration(
                icon: SvgPicture.asset("assets/icons/search.svg"),
                hintText: "Search",
                border: InputBorder.none)));
  }
}
