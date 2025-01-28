import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/presentation/widget/choice_chip/discrimination_choice_chip.dart';
import 'package:home_rabbit/presentation/widget/item/discrimination_info_item.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:provider/provider.dart';

class FirstInputView extends StatelessWidget {
  const FirstInputView({super.key});

  @override
  Widget build(BuildContext context) {
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: GoBackAppBar(
        myCallback: () {
          context.go('/home');
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: screenWidth * 0.8,
                  lineHeight: screenHeight * 0.03,
                  percent: 0.33,
                  animation: true,
                  animationDuration: 1000,
                  backgroundColor: Colors.white,
                  progressColor: HexColor('#1E319D'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.02, 0, screenWidth * 0.02, 0),
                  child: Text(
                    '(1/3)',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.025),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.06, 0),
                    child: Text(
                      '1. 계약 중 계약서 상의 집주인과 대면해 신분증을 확인하셨나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(
                    choiceChipTheme: 1,
                  ),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('대리인 이중계약');
                        context.go('/home/firstInput/systemQuestionInfo');
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: const Divider(
                      thickness: 2,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.06, 0),
                    child: Text(
                      '2. 기존 세입자가 계약 시작 날짜 전에 이사를 완료했나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(
                    choiceChipTheme: 2,
                  ),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('동일매물 중복계약');
                        context.go('/home/firstInput/systemQuestionInfo');
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: const Divider(
                      thickness: 2,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.06, 0),
                    child: Text(
                      '3. 해당 매물이 신탁 등기가 되어있나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(
                    choiceChipTheme: 3,
                  ),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('신탁 거래');
                        context.go('/home/firstInput/systemQuestionInfo');
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: const Divider(
                      thickness: 2,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.06, 0),
                    child: Text(
                      '4. 집주인이 체납 중인 세금이 존재하나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(
                    choiceChipTheme: 4,
                  ),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('세금 체납');
                        context.go('/home/firstInput/systemQuestionInfo');
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: const Divider(
                      thickness: 2,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: MainButton(
                      buttonText: '다음으로',
                      buttonWidth: double.infinity,
                      buttonHeight: screenHeight * 0.065,
                      myFontSize: screenWidth * 0.05,
                      myCallback: () {
                        context.go('/home/firstInput/secondInput');
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
