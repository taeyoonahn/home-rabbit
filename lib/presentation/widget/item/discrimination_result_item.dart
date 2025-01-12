import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:provider/provider.dart';

class DiscriminationResultItem extends StatelessWidget {
  final String riskFactor;
  const DiscriminationResultItem({super.key, required this.riskFactor});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        systemInfoViewModel.setCurrentRiskFactor(riskFactor);
        houseViewModel.goDetailManual(context,riskFactor);
      },
      child: Container(
        width: double.maxFinite,
        height: screenHeight * 0.25,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: HexColor('#1E319D'),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Image.asset('assets/icons/caution.png', width: screenWidth * 0.15),
            SizedBox(height: screenHeight * 0.015),
            Text(
              '$riskFactor 주의',
              style: TextStyle(
                fontFamily: 'SCDream',
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              '카드를 클릭해 자세한 내용을 확인하세요',
              style: TextStyle(
                fontFamily: 'SCDream',
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
