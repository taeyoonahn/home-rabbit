import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/bottom_sheet/paywall.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionPromotionView extends StatelessWidget {
  const SubscriptionPromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GoBackAppBar(
        myCallback: () {
          context.go('/home');
        },
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,screenWidth*0.03,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.015, screenWidth*0.025, screenWidth*0.015, screenWidth*0.025),
                      decoration: BoxDecoration(
                        color: HexColor('1E319D'),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "기능",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth*0.01,),
                          Container(
                            padding: EdgeInsets.all(screenWidth*0.015),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "  Free  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(screenWidth*0.015),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.purple, Colors.blue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Premium",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenWidth*0.03, screenWidth*0.08, screenWidth*0.03),
                      decoration: BoxDecoration(
                        color: HexColor('3351FF'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "매물 저장",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "1회",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "무제한",
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenWidth*0.03, screenWidth*0.08, screenWidth*0.03),
                      decoration: BoxDecoration(
                        color: HexColor('3351FF'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "매물 편집",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "없음",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "무제한",
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenWidth*0.03, screenWidth*0.08, screenWidth*0.03),
                      decoration: BoxDecoration(
                        color: HexColor('3351FF'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "위험 분석",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "1회",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "무제한",
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenWidth*0.03, screenWidth*0.04, screenWidth*0.03),
                      decoration: BoxDecoration(
                        color: HexColor('3351FF'),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "안전 보고서",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "단순 평가",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "무제한\n정밀 보고서",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                  //   child: Container(
                  //     padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenWidth*0.03, screenWidth*0.08, screenWidth*0.03),
                  //     decoration: BoxDecoration(
                  //       color: HexColor('3351FF'),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           "광고 제거",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontFamily: 'SCDream',
                  //             fontSize: screenWidth * 0.04,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Text(
                  //           "없음",
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //             fontFamily: 'SCDream',
                  //             fontSize: screenWidth * 0.04,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Text(
                  //           "무제한",
                  //           style: TextStyle(
                  //             color: Colors.amber,
                  //             fontFamily: 'SCDream',
                  //             fontSize: screenWidth * 0.04,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth*0.04,0,screenWidth*0.04,0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.015, screenWidth*0.025, screenWidth*0.015, screenWidth*0.025),
                      decoration: BoxDecoration(
                        color: HexColor('1E319D'),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "전세 사기 위험 분석을 무제한으로\n광고 없이 편하게",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.05),
                  MainButton(
                    buttonText: '집토끼 구독하고 무제한 위험 분석 하기!',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
