import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final double myFontSize;
  final VoidCallback? myCallback;
  const MainButton({super.key, required this.buttonText, required this.buttonWidth, required this.buttonHeight,required this.myFontSize, this.myCallback, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myCallback,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: HexColor('#1E319D'),
            borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: 'SCDream',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: myFontSize,
            ),
          ),
        ),
      ),
    );
  }
}