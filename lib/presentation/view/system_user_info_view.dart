import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/web_view/service_web_view.dart';
import 'package:provider/provider.dart';

class SystemUserInfoView extends StatelessWidget {
  const SystemUserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final systemInfoViewModel = context.read<SystemInfoViewModel>();
    final systemUserInfoUrl = systemInfoViewModel.getCurrentSystemUserInfoUrl();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: GoBackAppBar(
          myCallback: () {
            context.pop();
          },
        ),
        body: SafeArea(
          child: ServiceWebView(systemInfoUrl: systemUserInfoUrl),
        ),
      ),
    );
  }
}
