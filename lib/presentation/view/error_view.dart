import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/error.png',),
                Text(
                  '현재 서비스 상태 이상으로 인해',
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.05,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '사용하실 수 없습니다!',
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.05,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '신속하게 서비스를 복구하겠습니다.',
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.05,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: screenHeight * 0.05),
                MainButton(
                  buttonText: '홈으로 돌아가기',
                  buttonWidth: double.infinity,
                  buttonHeight: screenHeight * 0.065,
                  myFontSize: screenWidth * 0.05,
                  myCallback: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

