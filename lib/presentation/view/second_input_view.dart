import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/presentation/widget/choice_chip/discrimination_choice_chip.dart';
import 'package:home_rabbit/presentation/widget/item/discrimination_info_item.dart';
import 'package:home_rabbit/presentation/widget/text_field/discrimination_number_input_text_field.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class SecondInputView extends StatelessWidget {
  const SecondInputView({super.key});

  @override
  Widget build(BuildContext context) {
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    final houseViewModel = context.read<HouseViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: GoBackAppBar(
        myCallback: () {
          context.pop();
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
                  percent: 0.66,
                  animation: true,
                  animationDuration: 1000,
                  backgroundColor: Colors.white,
                  progressColor: HexColor('#1E319D'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.02, 0, screenWidth * 0.01, 0),
                  child: Text(
                    '(2/3)',
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
                      '5. 건축물대장에 위반건축물 표기가 되어있나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(choiceChipTheme: 5),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('불법 건축물');
                        context.go('/home/firstInput/secondInput/systemQuestionInfo');
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
                      '6. 중개사가 공인중개사 자격증을 가지고 있는 것을 확인하셨나요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(choiceChipTheme: 6),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('공인중개사 신뢰 불가');
                        context.go('/home/firstInput/secondInput/systemQuestionInfo');
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
                      '7. 해당 매물이 전세 보증 보험에 가입가능한가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationChoiceChip(choiceChipTheme: 7),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('보험 가입 불가');
                        context.go('/home/firstInput/secondInput/systemQuestionInfo');
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
                      '8. 해당 매물의 시세는 얼마인가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationNumberInputTextField(numberInputTheme: 8),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('매물 시세');
                        context.go('/home/firstInput/secondInput/systemQuestionInfo');
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
                      myCallback: () async {
                        await houseViewModel.updateHouse(houseViewModel.currentHouse!);
                        if (context.mounted) {
                          context.go('/home/firstInput/secondInput/thirdInput');
                        }
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