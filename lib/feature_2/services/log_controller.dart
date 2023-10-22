import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info/package_info.dart';
import 'package:geolocator/geolocator.dart';

class EventLoggerController {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  void logScreenEvent(String screenName) async {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    User? user = FirebaseAuth.instance.currentUser;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    String packageName = packageInfo.packageName;
    String appName = packageInfo.appName;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double latitude = position.latitude;
    double longitude = position.longitude;

    analytics.logEvent(
      name: 'screen_event_',
      parameters: {
        'user_id': user!.uid,
        'email': user.email,
        'event_name': screenName,
        'event_start_time': DateTime.now().toString(),
        'app_version': appVersion,
        'package_name': packageName,
        'app_name': appName,
        'lat': latitude,
        'long': longitude,
      },
    );
  }
}
