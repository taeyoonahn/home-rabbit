import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/bottom_sheet/paywall.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class DiscriminationResultView extends StatelessWidget {
  const DiscriminationResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final List<Widget> resultList = houseViewModel.showDiscriminationWidget();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<SubscriptionViewModel>(
      builder: (context, subscriptionViewModel, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: GoBackAppBar(
              myCallback: () {
                context.go('/home');
              },
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child:
                subscriptionViewModel.isSubscribed
                    ? Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.42,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
                      color: HexColor('#1E319D'),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '안전 보고서',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.08,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Stack(
                                children: [
                                  Text(
                                    houseViewModel.currentHouse!.rank,
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: screenWidth * 0.25,
                                      fontWeight: FontWeight.bold,
                                      color: houseViewModel.showHouseColor(),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: screenHeight * 0.14),
                                      Text(
                                        ' ${houseViewModel.currentHouse!.houseName}의 안전등급',
                                        style: TextStyle(
                                          fontFamily: 'SCDream',
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              Text(
                                houseViewModel.showHouseRisk(),
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              houseViewModel.currentHouse!.rank == 'A'
                                  ? Text(
                                '관련 정보를 주기적으로 체크해주세요',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                                  : Text(
                                '아래의 주의 항목들을 확인해보세요',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Column(
                      children: resultList,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: MainButton(
                        buttonText: '확인',
                        buttonWidth: double.infinity,
                        buttonHeight: screenHeight * 0.065,
                        myFontSize: screenWidth * 0.05,
                        myCallback: () {
                          context.go('/home');
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: MainButton(
                        buttonText: '다시 점검',
                        buttonWidth: double.infinity,
                        buttonHeight: screenHeight * 0.065,
                        myFontSize: screenWidth * 0.05,
                        myCallback: () {
                          context.go('/home/firstInput');
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                  ],
                )
                    : Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.42,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
                      color: HexColor('#1E319D'),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '안전 보고서',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.08,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Stack(
                                children: [
                                  Text(
                                    houseViewModel.currentHouse!.rank,
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: screenWidth * 0.25,
                                      fontWeight: FontWeight.bold,
                                      color: houseViewModel.showHouseColor(),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: screenHeight * 0.14),
                                      Text(
                                        ' ${houseViewModel.currentHouse!.houseName}의 안전등급',
                                        style: TextStyle(
                                          fontFamily: 'SCDream',
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              Text(
                                houseViewModel.showHouseRisk(),
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '집토끼 프리미엄을 구독하시면\n정밀 안전 보고서를 제공합니다',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Image.asset('assets/icons/lock.png',width: screenWidth*0.4,),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: MainButton(
                        buttonText: '집토끼 구독하고 정밀 안전보고서 받기!',
                        buttonWidth: double.infinity,
                        buttonHeight: screenHeight * 0.065,
                        myFontSize: screenWidth * 0.04,
                        myCallback: () async {
                          Offerings? offerings;
                          offerings = await Purchases.getOfferings();
                          if (offerings.current == null) {
                          } else {
                            await showModalBottomSheet(
                            useRootNavigator: true,
                            isDismissible: true,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setModalState) {
                                    return Paywall(
                                      offering: offerings!.current!,
                                    );
                                  });
                            },
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: MainButton(
                        buttonText: '확인',
                        buttonWidth: double.infinity,
                        buttonHeight: screenHeight * 0.065,
                        myFontSize: screenWidth * 0.05,
                        myCallback: () {
                          context.go('/home');
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                  ],
                )
              ),
            ),
          ),
        );
      }
    );
  }
}
