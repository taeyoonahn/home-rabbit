import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceWebView extends StatelessWidget {
  final String systemInfoUrl;
  const ServiceWebView({super.key, required this.systemInfoUrl});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(systemInfoUrl));

    return WebViewWidget(controller: controller);
  }
}