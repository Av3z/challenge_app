import 'dart:async';

import 'package:challenge_app/app/app_module.dart';
import 'package:challenge_app/app/app_widget.dart';
import 'package:challenge_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      runApp(ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ));
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}
