import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/data/data_source/house_data_source.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/widget/bottom_sheet/paywall.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/main_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/presentation/widget/button/sign_in_button.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';


class ServiceUserInfoView extends StatelessWidget {
  const ServiceUserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    // final adMobViewModel = context.read<AdMobViewModel>();
    final houseViewModel = context.read<HouseViewModel>();
    // adMobViewModel.disposeBanner();
    // adMobViewModel.loadBanner();
    String? uid;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer3<ServiceUserViewModel,SystemInfoViewModel, SubscriptionViewModel>(
        builder: (context, serviceUserViewModel, systemInfoViewModel, subscriptionViewModel, child) {
          uid = serviceUserViewModel.getCurrentUid();
          if (uid != "NULL") {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: const MainAppBar(text: '집토끼'),
              body: SafeArea(
                child: Column(
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: screenHeight * 0.09,
                    //   alignment: Alignment.center,
                    //   child: AdWidget(ad: adMobViewModel.showBanner()),
                    // ),
                    Container(
                      margin: EdgeInsets.all(screenWidth * 0.045),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: screenHeight * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: screenWidth * 0.025),
                              Text(
                                '집토끼에 오신 것을 환영합니다!',
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: 'SCDream',
                                    fontSize: screenWidth * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          GestureDetector(
                            onTap: () {
                              context.go('/serviceUserInfo/systemNotificationInfo');
                            },
                            child: Container(
                              width: double.maxFinite,
                              height: screenHeight * 0.09,
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.purple, Colors.blue],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(color: Colors.black12, width: 1.5),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    SizedBox(width: screenWidth*0.03),
                                    Image.asset('assets/icons/notification.png', width: screenWidth * 0.1),
                                    SizedBox(width: screenWidth*0.03),
                                    Text(
                                      '최신 공지사항을 확인하세요!',
                                      style: TextStyle(
                                        fontFamily: 'SCDream',
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          subscriptionViewModel.isSubscribed
                              ? MainButton(
                            buttonText: '구독 정보 확인',
                            buttonWidth: double.infinity,
                            buttonHeight: screenHeight * 0.07,
                            myFontSize: screenWidth * 0.05,
                            myCallback: () async {
                              await subscriptionViewModel.fetchSubscriptionEndDate();
                              if (context.mounted) {
                                subscriptionViewModel.fetchRevenueCat();
                                context.go('/serviceUserInfo/subscription');
                              }
                            },
                          )
                              : MainButton(
                            buttonText: '집토끼 구독하기',
                            buttonWidth: double.infinity,
                            buttonHeight: screenHeight * 0.07,
                            myFontSize: screenWidth * 0.05,
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
                          SizedBox(height: screenHeight * 0.04),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.025),
                                      child: Text(
                                        '문의 및 정보 관리',
                                        style: TextStyle(
                                            fontFamily: 'SCDream',
                                            fontSize: screenWidth * 0.05,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            systemInfoViewModel.setCurrentSystemUserInfoFactor('서비스 약관');
                                            context.go('/serviceUserInfo/systemUserInfo');
                                          },
                                          child: Text(
                                            '서비스 약관',
                                            style: TextStyle(
                                                fontFamily: 'SCDream',
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.07),
                                        TextButton(
                                          onPressed: () {
                                            systemInfoViewModel.setCurrentSystemUserInfoFactor('개인정보 처리방침');
                                            context.go('/serviceUserInfo/systemUserInfo');
                                          },
                                          child: Text(
                                            '개인정보 처리방침',
                                            style: TextStyle(
                                                fontFamily: 'SCDream',
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          style: TextStyle(fontSize: screenWidth * 0.035),
                                                          "로그아웃하시겠습니까?"),
                                                    ],
                                                  ),
                                                  actions: [
                                                    Center(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          MainButton(
                                                            buttonText: '로그아웃',
                                                            buttonHeight: 40,
                                                            buttonWidth: 70,
                                                            myFontSize: 12,
                                                            myCallback: () async {
                                                              Navigator.pop(context);
                                                              await HouseDataSource.logoutDB();
                                                              serviceUserViewModel.signOut(context);
                                                            },
                                                          ),
                                                          SizedBox(width: screenWidth * 0.08),
                                                          MainButton(
                                                            buttonText: '취소',
                                                            buttonHeight: 40,
                                                            buttonWidth: 70,
                                                            myFontSize: 12,
                                                            myCallback: () {
                                                              Navigator.pop(context);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            '로그아웃',
                                            style: TextStyle(
                                                fontFamily: 'SCDream',
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.13),
                                        TextButton(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          style: TextStyle(fontSize: screenWidth * 0.035),
                                                          "탈퇴하시겠습니까?\n탈퇴할 경우 유료 구독 정보를 포함한 회원님의 모든 데이터가 삭제되며 되돌릴 수 없습니다."),
                                                    ],
                                                  ),
                                                  actions: [
                                                    Center(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          MainButton(
                                                            buttonText: '삭제',
                                                            buttonHeight: 40,
                                                            buttonWidth: 70,
                                                            myFontSize: 12,
                                                            myCallback: () async {
                                                              Navigator.pop(context);
                                                              await serviceUserViewModel.deleteUser();
                                                              await houseViewModel.deleteAllHouse();
                                                              await serviceUserViewModel.signOut(context);
                                                            },
                                                          ),
                                                          SizedBox(width: screenWidth * 0.08),
                                                          MainButton(
                                                            buttonText: '취소',
                                                            buttonHeight: 40,
                                                            buttonWidth: 70,
                                                            myFontSize: 12,
                                                            myCallback: () {
                                                              Navigator.pop(context);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            '회원탈퇴',
                                            style: TextStyle(
                                                fontFamily: 'SCDream',
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          style: TextStyle(fontSize: screenWidth * 0.035),
                                                          "고객 센터는 카카오톡에서 집토끼 채널을 추가해 문의해주세요!"),
                                                    ],
                                                  ),
                                                  actions: [
                                                    Center(
                                                      child: MainButton(
                                                        buttonText: '확인',
                                                        buttonHeight: 40,
                                                        buttonWidth: 70,
                                                        myFontSize: 12,
                                                        myCallback: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            '고객센터',
                                            style: TextStyle(
                                                fontFamily: 'SCDream',
                                                fontSize: screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return _buildLoginView(context, screenWidth, screenHeight, serviceUserViewModel, systemInfoViewModel, subscriptionViewModel);
          }
        }
    );
  }
  Widget _buildLoginView(BuildContext context, double screenWidth, double screenHeight, ServiceUserViewModel serviceUserViewModel, SystemInfoViewModel systemInfoViewModel, SubscriptionViewModel subscriptionViewModel) {
    final houseViewModel = context.read<HouseViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MainAppBar(text: '집토끼'),
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   width: double.infinity,
            //   height: screenHeight * 0.09,
            //   alignment: Alignment.center,
            //   child: AdWidget(ad: context.read<AdMobViewModel>().showBanner()),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.005, left: screenWidth * 0.025),
                        child: Text(
                          '로그인 후 \n사용해주세요',
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.08,
                              color: Colors.black87,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Row(
                      children: [
                        Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                          child: Text(
                            '간편 로그인으로 이용하기',
                            style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.038,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        imagePath: 'google_login_icon',
                        onTap: () async {
                          await serviceUserViewModel.signIn(context, 'google');
                          String serviceUid = serviceUserViewModel.getCurrentUid();
                          await HouseDataSource.init(serviceUid);
                          await houseViewModel.fetchHouse();
                          await subscriptionViewModel.loginRevenueCat(serviceUid);
                          await subscriptionViewModel.fetchRevenueCat();
                          subscriptionViewModel.startSubscriptionCheck();
                        },
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      SignInButton(
                        imagePath: 'apple_login_icon',
                        onTap: () async {
                          await serviceUserViewModel.signIn(context, 'apple');
                          String serviceUid = serviceUserViewModel.getCurrentUid();
                          await HouseDataSource.init(serviceUid);
                          await houseViewModel.fetchHouse();
                          await subscriptionViewModel.loginRevenueCat(serviceUid);
                          await subscriptionViewModel.fetchRevenueCat();
                          subscriptionViewModel.startSubscriptionCheck();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "회원가입을 진행할 경우, ",
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            systemInfoViewModel.setCurrentSystemUserInfoFactor('서비스 약관');
                            context.go('/serviceUserInfo/systemUserInfo');
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: Text(
                              '서비스 약관',
                              style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Text(
                          " 및 ",
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            systemInfoViewModel.setCurrentSystemUserInfoFactor('개인정보 처리방침');
                            context.go('/serviceUserInfo/systemUserInfo');
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: Text(
                              '개인정보 처리방침',
                              style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        Text(
                          "에 동의한 것으로 간주합니다.",
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}