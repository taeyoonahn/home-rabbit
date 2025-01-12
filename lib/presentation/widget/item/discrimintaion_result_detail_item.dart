import 'package:flutter/material.dart';

class DiscriminationResultDetailItem extends StatelessWidget {
  final String resultInfoText;
  const DiscriminationResultDetailItem({super.key, required this.resultInfoText});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.001),
                  Image.asset('assets/icons/shield_detail.png', width: screenWidth * 0.08),
                ],
              ),
              SizedBox(width: screenWidth * 0.03),
              Flexible(
                child: Text(
                  resultInfoText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.025),
      ],
    );
  }
}
