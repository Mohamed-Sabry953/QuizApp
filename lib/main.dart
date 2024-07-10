import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/features/home/manger/themeProvider.dart';
import 'package:quiz_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (context) => SettingProvider(),
  child: const MyApp(),
  ));
}
