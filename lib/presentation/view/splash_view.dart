import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final systemInfoViewModel = context.read<SystemInfoViewModel>();

    Future.delayed(const Duration(seconds: 2), () async {
      systemInfoViewModel.fetchResultInfoTexts();
      if (context.mounted) {
        context.go('/home');
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