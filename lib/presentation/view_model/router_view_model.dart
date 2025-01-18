import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_rabbit/presentation/view/error_view.dart';
import 'package:home_rabbit/presentation/view/user_name_view.dart';
import 'package:home_rabbit/presentation/view/subscription_promotion_view.dart';
import 'package:home_rabbit/presentation/view/subscription_view.dart';
import 'package:home_rabbit/presentation/view/system_notification_info_view.dart';
import 'package:home_rabbit/presentation/view/system_user_info_view.dart';
import 'package:provider/provider.dart';
import 'package:home_rabbit/presentation/view_model/navigation_view_model.dart';
import 'package:home_rabbit/presentation/widget/navigation_bar/main_navigation_bar.dart';
import 'package:home_rabbit/presentation/view/discrimination_result_detail_view.dart';
import 'package:home_rabbit/presentation/view/discrimination_result_view.dart';
import 'package:home_rabbit/presentation/view/first_input_view.dart';
import 'package:home_rabbit/presentation/view/home_view.dart';
import 'package:home_rabbit/presentation/view/second_input_view.dart';
import 'package:home_rabbit/presentation/view/splash_view.dart';
import 'package:home_rabbit/presentation/view/system_question_info_view.dart';
import 'package:home_rabbit/presentation/view/third_input_view.dart';
import 'package:home_rabbit/presentation/view/service_user_info_view.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';

class RouterViewModel extends ChangeNotifier {
  final GoRouter _goRouter;

  RouterViewModel()
      : _goRouter = GoRouter(
          initialLocation: '/splash',
          errorBuilder: (context, state) {
            return const ErrorView();
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/splash',
              builder: (context, state) => const SplashView(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'userName',
                  builder: (context, state) =>
                      const UserNameView(),
                ),
              ],
            ),
            GoRoute(
              path: '/error',
              builder: (context, state) => const ErrorView(),
            ),
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return ChangeNotifierProvider(
                  create: (_) =>
                      NavigationViewModel(navigationShell: navigationShell),
                  child: MainNavigationBar(navigationShell: navigationShell),
                );
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/home',
                      builder: (context, state) {
                        return ChangeNotifierProvider(
                          create: (_) => LoadingViewModel(),
                          child: const HomeView(),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'firstInput',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const FirstInputView(),
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'systemQuestionInfo',
                              builder: (context, state) {
                                return ChangeNotifierProvider(
                                  create: (_) => LoadingViewModel(),
                                  child: const SystemQuestionInfoView(),
                                );
                              },
                            ),
                            GoRoute(
                              path: 'secondInput',
                              builder: (context, state) {
                                return ChangeNotifierProvider(
                                  create: (_) => LoadingViewModel(),
                                  child: const SecondInputView(),
                                );
                              },
                              routes: <RouteBase>[
                                GoRoute(
                                  path: 'systemQuestionInfo',
                                  builder: (context, state) {
                                    return ChangeNotifierProvider(
                                      create: (_) => LoadingViewModel(),
                                      child: const SystemQuestionInfoView(),
                                    );
                                  },
                                ),
                                GoRoute(
                                  path: 'thirdInput',
                                  builder: (context, state) {
                                    return ChangeNotifierProvider(
                                      create: (_) => LoadingViewModel(),
                                      child: const ThirdInputView(),
                                    );
                                  },
                                  routes: <RouteBase>[
                                    GoRoute(
                                      path: 'systemQuestionInfo',
                                      builder: (context, state) {
                                        return ChangeNotifierProvider(
                                          create: (_) => LoadingViewModel(),
                                          child: const SystemQuestionInfoView(),
                                        );
                                      },
                                    ),
                                    GoRoute(
                                      path: 'discriminationResult',
                                      builder: (context, state) {
                                        return ChangeNotifierProvider(
                                          create: (_) => LoadingViewModel(),
                                          child:
                                              const DiscriminationResultView(),
                                        );
                                      },
                                      routes: <RouteBase>[
                                        GoRoute(
                                          path: 'firstInput',
                                          builder: (context, state) {
                                            return ChangeNotifierProvider(
                                              create: (_) => LoadingViewModel(),
                                              child: const FirstInputView(),
                                            );
                                          },
                                        ),
                                        GoRoute(
                                          path: 'discriminationResultDetail',
                                          builder: (context, state) {
                                            return ChangeNotifierProvider(
                                              create: (_) => LoadingViewModel(),
                                              child:
                                                  const DiscriminationResultDetailView(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        GoRoute(
                          path: 'discriminationResult',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const DiscriminationResultView(),
                            );
                          },
                        ),
                        GoRoute(
                          path: 'subscriptionPromotion',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const SubscriptionPromotionView(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/serviceUserInfo',
                      builder: (context, state) {
                        return ChangeNotifierProvider(
                          create: (_) => LoadingViewModel(),
                          child: const ServiceUserInfoView(),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'subscription',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const SubscriptionView(),
                            );
                          },
                        ),
                        GoRoute(
                          path: 'systemUserInfo',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const SystemUserInfoView(),
                            );
                          },
                        ),
                        GoRoute(
                          path: 'systemNotificationInfo',
                          builder: (context, state) {
                            return ChangeNotifierProvider(
                              create: (_) => LoadingViewModel(),
                              child: const SystemNotificationInfoView(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        );

  GoRouter get goRouter => _goRouter;
}
