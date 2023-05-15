import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/src/core/di/service_locator.dart';
import 'package:movie_app/src/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MovieApp());
}
