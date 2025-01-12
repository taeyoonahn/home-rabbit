import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:home_rabbit/util/system_string.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionViewModel extends ChangeNotifier {
  bool entitlementIsActive = false;
  String appUserID = '';
  late LogInResult currentRevenueCatLogin;
  late CustomerInfo customerInfo;
  bool isSubscribed = false;
  String subscriptionExpirationDate = '';
  Timer? _subscriptionTimer;
  static final LoadingViewModel _loadingViewModel = LoadingViewModel();

  Future<void> fetchRevenueCat() async {
    _loadingViewModel.loading();
    try {
      customerInfo = await Purchases.getCustomerInfo();
      notifyListeners();
      if (customerInfo.entitlements.all[entitlementID] != null &&
          customerInfo.entitlements.all[entitlementID]?.isActive == true) {
        isSubscribed = true;
        notifyListeners();
      } else {
        isSubscribed = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> loginRevenueCat(String serviceUid) async {
    _loadingViewModel.loading();
    try {
      LogInResult revenueCatLogin = await Purchases.logIn(serviceUid);
      currentRevenueCatLogin = revenueCatLogin;
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> restoreRevenueCat(BuildContext context, double screenWidth) async {
    _loadingViewModel.loading();
    try {
      await Purchases.restorePurchases();
      CustomerInfo customerInfoForRestore = await Purchases.getCustomerInfo();
      bool hasActiveEntitlements = customerInfoForRestore.entitlements.active
          .isNotEmpty;

      if (hasActiveEntitlements) {
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
                      "구매 복원을 완료했습니다!"
                  ),
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
      } else {
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
                      "복원할 구매 내역이 없습니다."
                  ),
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
                      Navigator.pop(context);},
                    ),
                  ),
                ],
              );
            },
          );
        }
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> fetchSubscriptionEndDate() async {
    try {
      final entitlement = customerInfo.entitlements.active[entitlementID];
      if (entitlement != null && entitlement.expirationDate != null) {
        String isoDateString = entitlement.expirationDate!;
        DateTime utcDate = DateTime.parse(isoDateString);
        DateTime localDate = utcDate.toLocal();
        subscriptionExpirationDate = DateFormat("yyyy년 MM월 dd일 HH:mm:ss").format(localDate);
      }
    } catch (e) {
      rethrow;
    }
  }

  void startSubscriptionCheck() {
    _subscriptionTimer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      await fetchRevenueCat();
    });
  }

  void stopSubscriptionCheck() {
    _subscriptionTimer?.cancel();
  }

  @override
  void dispose() {
    stopSubscriptionCheck();
    super.dispose();
  }
}


