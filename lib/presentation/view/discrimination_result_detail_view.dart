import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:provider/provider.dart';

class DiscriminationResultDetailView extends StatelessWidget {
  const DiscriminationResultDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    List<Widget> resultDetail = systemInfoViewModel.getCurrentResultDetail();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1E319D),
        appBar: GoBackAppBar(
          myCallback: () {
            context.go('/home/firstInput/secondInput/thirdInput/discriminationResult');
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: screenHeight * 0.25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.025),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.05),
                            Image.asset(
                              'assets/icons/caution.png',
                              width: screenWidth * 0.1,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.012),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              '${systemInfoViewModel.currentRiskFactor} 문제',
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.065,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.004),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.0525),
                            Text(
                              '꼼꼼이 읽어보시고 해결할 수 있는 문제인지 확인해보세요',
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.2),
                        Container(
                          color: Colors.white,
                          child: Container(
                            height: screenHeight * 0.05,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1E319D),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: resultDetail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
