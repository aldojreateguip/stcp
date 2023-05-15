import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.background});
  final String title;
  final String background;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0), // here the desired height
      child: AppBar(
        title: Text(title),
        backgroundColor: HexColor(background),
      ),
    );
  }
}
