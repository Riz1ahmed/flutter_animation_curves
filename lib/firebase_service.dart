import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_curve_animation/firebase_options.dart';

class FirebaseService {
  static Future<void> initialize() async {
    ///Init firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _setupCrashlytics();
  }

  static void _setupCrashlytics() {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (!kDebugMode) {
        debugPrint('------CRASHLYTICS(FlutterError) pass to firebase------');
        FirebaseCrashlytics.instance.recordFlutterError(details);
      } else {
        debugPrint('------CRASHLYTICS(FlutterError) (in DebugMode)------');

        debugPrint('xyz: passing to firebase');
        FirebaseCrashlytics.instance.recordFlutterError(details);

        debugPrint('xyz: crashDetails => $details');
        debugPrint('------CRASHLYTICS(FlutterError) (in DebugMode) END------');
      }
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kDebugMode) {
        debugPrint('----CRASHLYTICS(Error) pass to firebase----');
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      } else {
        debugPrint('-----CRASHLYTICS(PlatformDispatcher) (in DebugMode)-----');
        debugPrint('Error: $error');
        debugPrint('Stacktrace: $stack');
        debugPrint('---CRASHLYTICS(PlatformDispatcher) (in DebugMode) END---');
      }
      return true;
    };
  }
}
