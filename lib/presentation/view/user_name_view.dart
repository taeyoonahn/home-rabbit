import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/data/data_source/house_data_source.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:provider/provider.dart';

class UserNameView extends StatelessWidget {
  const UserNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final subscriptionViewModel = context.read<SubscriptionViewModel>();
    final houseViewModel = context.read<HouseViewModel>();
    final controller = TextEditingController();

    return Consumer<ServiceUserViewModel>(
      builder: (context, serviceUserViewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      "닉네임을 설정해주세요",
                      style: TextStyle(
                          fontFamily: 'SCDream',
                          fontSize: screenWidth * 0.06,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "한글 및 영어 대소문자 사용해 최대 6글자로 입력해주세요",
                      style: TextStyle(
                          fontFamily: 'SCDream',
                          fontSize: screenWidth * 0.03,
                          color: HexColor('#1E319D'),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextField(
                      controller: controller,
                      onChanged: (value) {
                        serviceUserViewModel.setUserName(value);
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      textAlign: TextAlign.left,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Zㄱ-ㅎ가-힣]')
                        ),
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(
                              color: Colors.black87, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor('#1E319D'),
                              width: screenWidth * 0.004),
                        ),
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: '입력해주세요',
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                    const Spacer(),
                    MainButton(
                      buttonText: '집토끼 시작하기',
                      buttonWidth: double.infinity,
                      buttonHeight: screenHeight * 0.07,
                      myFontSize: screenWidth * 0.05,
                      myCallback: () async {
                        await HouseDataSource.init(serviceUserViewModel.getCurrentUserName());
                        await subscriptionViewModel.fetchRevenueCat();
                        await houseViewModel.fetchHouse();
                        if (context.mounted) {
                          context.go('/home');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
