import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:provider/provider.dart';
import 'package:track_flow/feature_1/screens/splash_screen.dart';
import 'package:track_flow/feature_1/widgets/color.dart';
import 'package:track_flow/feature_1/widgets/decoration.dart';
import 'package:track_flow/feature_1/widgets/routes.dart';
import 'package:track_flow/feature_1/widgets/txt_style.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  final isJailbroken = await FlutterJailbreakDetection.jailbroken;
  var connectivityResult = await Connectivity().checkConnectivity();
  final isVPNConnected = connectivityResult == ConnectivityResult.vpn;

  if (isJailbroken || isVPNConnected) {
    FirebaseCrashlytics.instance.crash();
    debugPrint("Device is VPnConnected");
  } else {
    runZonedGuarded(() async {
      runApp(const MyApp());
    }, (error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace, fatal: true);
    });
  }
}

class MyApp extends StatelessWidget {
  final String? themeCode;
  const MyApp({super.key, this.themeCode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return MultiProvider(
      providers: [
        Provider<AppColor>(create: (context) => AppColor(context)),
        Provider<AppDecoration>(create: (context) => AppDecoration(context)),
        Provider<AppText>(create: (context) => AppText(context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        navigatorKey: navigatorKey,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        home: const SplashScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
