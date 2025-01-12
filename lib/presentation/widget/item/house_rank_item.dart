import 'package:flutter/material.dart';

class HouseRankItem extends StatelessWidget {
  final String houseRank;
  const HouseRankItem({super.key, required this.houseRank});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double containerSize = screenWidth * 0.09;
    double fontSize = screenWidth * 0.038;

    BoxDecoration decoration(Color color) {
      return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3), // 유지
      );
    }

    Widget rankContainer(String text, Color color) {
      return Container(
        height: containerSize,
        width: containerSize,
        decoration: decoration(color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }

    switch (houseRank) {
      case 'TBD':
        return rankContainer('?', Colors.grey.shade600);
      case 'A':
        return rankContainer('A', Colors.blue.shade400);
      case 'B':
        return rankContainer('B', Colors.greenAccent.shade700);
      case 'C':
        return rankContainer('C', Colors.yellow);
      case 'D':
        return rankContainer('D', Colors.red);
      default:
        return rankContainer('?', Colors.black87);
    }
  }
}
