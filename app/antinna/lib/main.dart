import 'dart:async';


import 'core/firebase/analytics.dart';
import 'core/firebase/crashlytics.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app.dart';
import 'injection.dart';
import 'core/di/service_locator.dart';
import 'core/i18n/translations.g.dart';
import 'core/log/log.dart';

void main() => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        LocaleSettings.useDeviceLocale();
  
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
   
        await configureDependencies();
        await Future.wait(
          [
            getIt.allReady(),
              
            getIt<Analytics>().initialize(),
            getIt<Crashlytics>().initialize(),
            
            initializeDateFormatting('id'),
            initializeDateFormatting('en'),
            SystemChrome.setPreferredOrientations(
              [
                DeviceOrientation.portraitUp,
              ],
            ),
          ],
        );
        EasyLoading.instance
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..maskType = EasyLoadingMaskType.black
          ..userInteractions = true
          ..dismissOnTap = false;

        Intl.systemLocale = 'en';

        runApp(
          MultiBlocProvider(
            providers: Injection.instance.initBloc(),
            child: AntinnaApp(
              key: const Key('antinna-App'),
            ),
          ),
        );
      },
      (error, stack) {
         
        getIt<Crashlytics>().report(error, stack);  
        
        
      },
    );
