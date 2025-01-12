import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/util/system_string.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class Paywall extends StatelessWidget {
  final Offering offering;
  static final LoadingViewModel _loadingViewModel = LoadingViewModel();

  const Paywall({super.key, required this.offering});

  @override
  Widget build(BuildContext context) {
    final subscriptionViewModel = context.read<SubscriptionViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return SingleChildScrollView(
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Container(
              height: 70.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor('#1E319D'),
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Center(
                  child:
                  Text(
                    '✨ 집토끼 구독 ✨',
                    style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight*0.03, bottom: screenHeight*0.01, left: screenWidth * 0.04, right: screenWidth * 0.04,),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '구매하실 구독권을 선택해주세요',
                  style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02,),
              child: ListView.builder(
                itemCount: offering.availablePackages.length,
                itemBuilder: (BuildContext context, int index) {
                  var myProductList = offering.availablePackages;
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.01),
                    child: Card(
                      color: HexColor('#1E319D'),
                      child: ListTile(
                          onTap: () async {
                            try {
                              _loadingViewModel.loading();
                              CustomerInfo customerInfo = await Purchases.purchasePackage(myProductList[index]);
                              EntitlementInfo? entitlement = customerInfo.entitlements.all[entitlementID];
                              subscriptionViewModel.entitlementIsActive = entitlement?.isActive ?? false;
                              await subscriptionViewModel.fetchRevenueCat();
                              if (context.mounted) {
                                context.pop();
                              }
                            } catch (e) {
                              rethrow;
                            } finally {
                              _loadingViewModel.notLoading();
                            }
                          },
                          title: Padding(
                            padding: EdgeInsets.only(bottom: screenWidth * 0.005),
                            child: Text(
                              myProductList[index].storeProduct.title,
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            myProductList[index].storeProduct.description,
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(
                            myProductList[index].storeProduct.priceString,
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          )
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight*0.01, left: screenWidth * 0.03, right: screenWidth * 0.03,),
              child: MainButton(
                buttonText: '구매 복원하기',
                buttonWidth: double.infinity,
                buttonHeight: screenHeight * 0.06,
                myFontSize: screenWidth * 0.04,
                myCallback: () async {
                  await subscriptionViewModel.restoreRevenueCat(context,screenWidth);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
