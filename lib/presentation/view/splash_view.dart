import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/data/data_source/house_data_source.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    final serviceUserViewModel = context.read<ServiceUserViewModel>();
    final subscriptionViewModel = context.read<SubscriptionViewModel>();

    Future.delayed(const Duration(seconds: 2), () async {
      await systemInfoViewModel.fetchResultInfoTexts();
      await serviceUserViewModel.loadUserNameFromStorage();

      String currentUserName = serviceUserViewModel.getCurrentUserName();
      if (context.mounted) {
        if(currentUserName=='') {
          context.go('/splash/userName');
        } else {
          await HouseDataSource.init(serviceUserViewModel.getCurrentUserName());
          await subscriptionViewModel.fetchRevenueCat();
          await houseViewModel.fetchHouse();
          if (context.mounted) {
            context.go('/home');
          }
        }
      }
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/home_rabbit_logo.png',
            ),
          ],
        ),
      ),
    );
  }
}