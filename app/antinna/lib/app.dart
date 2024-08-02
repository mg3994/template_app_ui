import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:antinna_ui_kit/antinna_ui_kit.dart';

import 'base/lifecycle_manager.dart';
import 'core/di/service_locator.dart';
import 'core/log/log.dart';
import 'router/observers/a_route_observer.dart';
import 'router/a_router.dart';

class AntinnaApp extends StatelessWidget {
  AntinnaApp({super.key});

  final router = getIt<ARouter>();

  @override
  Widget build(BuildContext context) => AComponentInit(
      builder: (context) => MaterialApp.router(
            title: 'Antinna',
            theme: ATheme.main().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                AColorTheme.light,
              ],
            ),
            darkTheme: ATheme.main().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                AColorTheme.dark,
              ],
            ),
            routerDelegate: AutoRouterDelegate(
              router,
              navigatorObservers: () => [
                ARouteObserver(),
              ],
            ),
            routeInformationParser: router.defaultRouteParser(),
            locale: const Locale('id', 'ID'),
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(
              builder: (context, child) => child == null
                  ? nil
                  : LifecycleManager(
                      child: child,
                      lifeCycle: (state) {
                        var logger = getIt<Log>();
                        switch (state) {
                          case AppLifecycleState.resumed:
                            logger.console('App is resumed.');
                            break;
                          case AppLifecycleState.inactive:
                            logger.console('App is inactive.');
                            break;
                          case AppLifecycleState.paused:
                            logger.console('App is paused.');
                            break;
                          case AppLifecycleState.detached:
                            logger.console('App is detached.');
                            break;
                        }
                      },
                    ),
            ),
          ));
}
