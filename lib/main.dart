import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/src/app.dart';
import 'package:path_provider/path_provider.dart';

import 'src/core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final dir = getApplicationDocumentsDirectory();
  //final isar =  await Isar.open([EmailSchema], directory: dir);
  // Bloc.observer = SimpleBlocObserver();

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(
    App(authenticationRepository: authenticationRepository),
  );
}
