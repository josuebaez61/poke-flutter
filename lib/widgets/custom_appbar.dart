import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final String titleText;
  final Color backgroundColor;

  CustomAppBar({this.titleText = "PokeFlutter", this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      titleTextStyle: TextStyle(color: Colors.black),
      textTheme: TextTheme().copyWith(
          headline6: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      )),
      elevation: 0.0,
      // backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
      ],
      title: Text(
        titleText,
      ),
    );
  }
}
