import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:provider/provider.dart';

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key,});

  @override
  Widget build(BuildContext context) {
    final subscriptionViewModel = context.read<SubscriptionViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: GoBackAppBar(
        myCallback: () {
          context.go('/serviceUserInfo');
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/home_rabbit_logo.png'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                  child: Text(
                    '집토끼 구독 중!',
                    style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.08,
                        color: Colors.black87,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Text(
                  subscriptionViewModel.subscriptionExpirationDate,
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.05,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '구독이 만료 될 예정입니다.',
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.05,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight*0.02, left: screenWidth * 0.03, right: screenWidth * 0.03,),
                  child: MainButton(
                    buttonText: '확인',
                    buttonWidth: double.infinity,
                    buttonHeight: screenHeight * 0.06,
                    myFontSize: screenWidth * 0.04,
                    myCallback: () async {
                      context.go('/serviceUserInfo');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

