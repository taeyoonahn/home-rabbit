import 'dart:io';
import 'package:home_rabbit/util/store_config.dart';
import 'package:home_rabbit/util/system_string.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:home_rabbit/presentation/view_model/router_view_model.dart';
import 'package:provider/provider.dart';
import 'package:home_rabbit/di/provider_di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: appleApiKey,
    );
  } else if (Platform.isAndroid) {
    StoreConfig(
      store: Store.playStore,
      apiKey: googleApiKey,
    );
  }

  WidgetsFlutterBinding.ensureInitialized();

  await configureSDK();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  final providers = await providerDi();
  MobileAds.instance.initialize();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

Future<void> configureSDK() async {
  await Purchases.setLogLevel(LogLevel.debug);
  PurchasesConfiguration configuration;
  configuration = PurchasesConfiguration(StoreConfig.instance.apiKey)
    ..appUserID = null
    ..purchasesAreCompletedBy = const PurchasesAreCompletedByRevenueCat();
  await Purchases.configure(configuration);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerViewModel = context.read<RouterViewModel>();
    final GoRouter goRouter = routerViewModel.goRouter;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'HomeRabbit',
      theme: ThemeData(fontFamily: 'Pretendard',),
      routerConfig: goRouter,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: child,
        );
      },
    );
  }
}