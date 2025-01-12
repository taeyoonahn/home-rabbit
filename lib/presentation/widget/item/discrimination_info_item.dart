import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscriminationInfoItem extends StatelessWidget {
  final String infoText;
  final VoidCallback? myCallback;
  const DiscriminationInfoItem({super.key, required this.infoText, this.myCallback});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: myCallback,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, screenWidth * 0.01, 0, screenWidth * 0.01),
        decoration: BoxDecoration(
          color: HexColor('#1E319D'),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.035),
            Icon(
              Icons.info_outline,
              size: screenWidth * 0.04,
              color: Colors.white,
            ),
            SizedBox(width: screenWidth * 0.015),
            Text(
              infoText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.035,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
