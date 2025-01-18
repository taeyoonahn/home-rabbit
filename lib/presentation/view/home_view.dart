import 'package:flutter/material.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:provider/provider.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/navigation_view_model.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/main_app_bar.dart';
import 'package:home_rabbit/presentation/widget/button/add_floating_button.dart';
import 'package:home_rabbit/presentation/widget/button/up_floating_button.dart';
import 'package:home_rabbit/presentation/widget/item/house_item.dart';

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
        return Scaffold(
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
                // Container(
                //   height: screenHeight * 0.03,
                //   decoration: BoxDecoration(
                //     border: Border(
                //       bottom: BorderSide(
                //         color: Colors.grey.withOpacity(0.5),
                //       ),
                //     ),
                //   ),
                // ),
                houseViewModel.myHouses.isNotEmpty
                    ? Flexible(
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight*0.05,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: screenWidth * 0.0025,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                    ],
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
        );
      },
    );
  }
}
