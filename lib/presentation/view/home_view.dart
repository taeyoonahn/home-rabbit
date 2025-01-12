import 'package:flutter/material.dart';
import 'package:home_rabbit/presentation/widget/bottom_sheet/paywall.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:provider/provider.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/navigation_view_model.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/main_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/add_floating_button.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/presentation/widget/button/up_floating_button.dart';
import 'package:home_rabbit/presentation/widget/item/house_item.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final adMobViewModel = context.read<AdMobViewModel>();
    final navigationViewModel = context.read<NavigationViewModel>();
    // adMobViewModel.disposeBanner();
    // adMobViewModel.loadBanner();
    final ScrollController scrollController = ScrollController();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer3<ServiceUserViewModel, HouseViewModel, SubscriptionViewModel>(
      builder: (context, serviceUserViewModel, houseViewModel, subscriptionViewModel, child) {
        return serviceUserViewModel.user != null
            ? (
            subscriptionViewModel.isSubscribed
                ? Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: AddFloatingButton(),
              ),
              SizedBox(width: screenWidth * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: UpFloatingButton(scrollController: scrollController),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  height: screenHeight * 0.03,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                houseViewModel.myHouses.isNotEmpty
                    ? Flexible(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: houseViewModel.myHouses.length,
                      itemBuilder: (context, index) {
                        return HouseItem(
                            house: houseViewModel.myHouses[index]);
                      },
                    ),
                  ),
                )
                    : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '분석 대상이 없습니다',
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.065,
                              color: Colors.black87,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Center(
                        child: Text(
                          '분석할 매물을 추가해주세요!',
                          style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.065,
                              color: Colors.black87,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.13),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
                : _buildSubscriptionContent(context,screenWidth, screenHeight, navigationViewModel, true)
            )
            : _buildSubscriptionContent(context, screenWidth, screenHeight, navigationViewModel, false);
      },
    );
  }

  Widget _buildSubscriptionContent(BuildContext context, double screenWidth, double screenHeight,
      NavigationViewModel navigationViewModel, bool isSigned) {
    return Scaffold(
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
            Expanded(
              child: Container(
                margin: EdgeInsets.all(screenWidth * 0.045),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.06),
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.5,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black12, width: 1.5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                            child: Column(
                              children: [
                                Text(
                                  isSigned
                                      ? '집토끼 구독하고\n전세 사기 예방해요!'
                                      : '세상 무엇보다 소중한 내 보증금\n혹시 위험하진 않을까?',
                                  style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.08),
                          Center(
                              child: Image.asset(
                                  isSigned ? 'assets/icons/check.png' : 'assets/icons/money.png',
                                  width: screenWidth * 0.22)),
                          SizedBox(height: screenHeight * 0.08),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '커피 한 잔 가격으로',
                                  style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: screenWidth * 0.065,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '한달간 무제한 전세 위험 분석!',
                                  style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: screenWidth * 0.065,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    MainButton(
                      buttonText: isSigned ? '집토끼 구독하기' : '집토끼 구독하고 전세 사기 방지하기',
                      buttonWidth: double.infinity,
                      buttonHeight: screenHeight * 0.07,
                      myFontSize: screenWidth * 0.05,
                      myCallback: isSigned
                          ? () async {
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
                      }
                          : () {navigationViewModel.goBranch(1);}
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
