import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stcp/main.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header(
      {super.key,
      required this.title,
      required this.background,
      required this.height});
  final String title;
  final String background;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      backgroundColor: HexColor(background),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
