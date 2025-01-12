import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/widget/app_bar/go_back_app_bar.dart';
import 'package:home_rabbit/presentation/widget/web_view/service_web_view.dart';

class SystemNotificationInfoView extends StatelessWidget {
  const SystemNotificationInfoView({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const SafeArea(
          child: ServiceWebView(systemInfoUrl: 'https://upbeat-double-f6b.notion.site/136c0755d3c780579b38ee17369a067b'),
        ),
      ),
    );
  }
}
