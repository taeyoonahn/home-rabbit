import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/presentation/widget/item/discrimination_info_item.dart';
import 'package:home_rabbit/presentation/widget/text_field/discrimination_number_input_text_field.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class ThirdInputView extends StatelessWidget {
  const ThirdInputView({super.key});

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
                  percent: 1.0,
                  animation: true,
                  animationDuration: 1000,
                  backgroundColor: Colors.white,
                  progressColor: HexColor('#1E319D'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.02, 0, screenWidth * 0.01, 0),
                  child: Text(
                    '(3/3)',
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
                      '9. 해당 매물의 근저당권은 얼마인가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationNumberInputTextField(numberInputTheme: 9),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('근저당권');
                        context.go('/home/firstInput/secondInput/thirdInput/systemQuestionInfo');
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
                      '10. 해당 매물의 선순위 보증금의 총합은 얼마인가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationNumberInputTextField(numberInputTheme: 10),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('선순위 보증금');
                        context.go('/home/firstInput/secondInput/thirdInput/systemQuestionInfo');
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
                      '11. 해당 매물의 전세보증금액은 얼마인가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationNumberInputTextField(numberInputTheme: 11),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('전세보증금액');
                        context.go('/home/firstInput/secondInput/thirdInput/systemQuestionInfo');
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
                      '12. 해당 매물의 최우선변제금액은 얼마인가요?',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const DiscriminationNumberInputTextField(numberInputTheme: 12),
                  SizedBox(height: screenHeight * 0.027),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.06, 0, screenWidth * 0.25, 0),
                    child: DiscriminationInfoItem(
                      infoText: '이곳에서 관련 상세 안내를 확인하세요!',
                      myCallback: () {
                        systemInfoViewModel.setCurrentQuestionInfoFactor('최우선 변제금액');
                        context.go('/home/firstInput/secondInput/thirdInput/systemQuestionInfo');
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
                      buttonText: '결과 확인',
                      buttonWidth: double.infinity,
                      buttonHeight: screenHeight * 0.065,
                      myFontSize: screenWidth * 0.05,
                      myCallback: () async {
                        await houseViewModel.updateHouse(houseViewModel.currentHouse!);
                        houseViewModel.assessRisk();
                        houseViewModel.turnIsDiscriminatedTrue();
                        if (context.mounted) {
                          await houseViewModel.updateHouse(houseViewModel.currentHouse!);
                          await houseViewModel.assessFinancialRisk();
                          context.go('/home/firstInput/secondInput/thirdInput/discriminationResult');
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