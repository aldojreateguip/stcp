import 'package:flutter/material.dart';

class LogoMuni extends StatelessWidget {
  const LogoMuni({super.key});

  @override
  Widget build(BuildContext context) {
    const double radiusX = 200, radiusY = 30;
    const String imageUrl = 'assets/images/logo_muni.jpg';
    const Color opacityColor = Colors.black;

    final screenHeight = MediaQuery.of(context).size.height;
    final bodyHeight = screenHeight * 0.45;

    return Center(
      child: Container(
        height: bodyHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(radiusX, radiusY),
            bottomLeft: Radius.elliptical(radiusX, radiusY),
          ),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Opacity(
          opacity: 0.1,
          child: Container(
            decoration: const BoxDecoration(
              color: opacityColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(radiusX, radiusY),
                bottomLeft: Radius.elliptical(radiusX, radiusY),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
