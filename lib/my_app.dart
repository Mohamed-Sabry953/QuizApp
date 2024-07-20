import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/features/Questions/pages/questionsPage.dart';
import 'package:quiz_app/features/answerAndDgree/pages/answerAndDgree.dart';
import 'package:quiz_app/features/home/manger/themeProvider.dart';
import 'package:quiz_app/features/home/pages/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/home/pages/privacyPolicy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // arabic
        ],
        locale: Locale(provider.language),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routes: {
          Homepage.routeName:(context)=>Homepage(),
          QuestionsPage.routeName:(context)=>QuestionsPage(),
          AnswerAndDgreePage.routeName:(context)=>AnswerAndDgreePage(),
          PrivacyPolicyPage.routeName:(context)=>PrivacyPolicyPage(),
        },
        initialRoute: Homepage.routeName,

      ),
    );
  }
}
