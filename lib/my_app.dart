import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/pages/questionsPage.dart';
import 'package:quiz_app/features/home/pages/homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Homepage.routeName:(context)=>Homepage(),
          QuestionsPage.routeName:(context)=>QuestionsPage(),
        },
        initialRoute: Homepage.routeName,
      ),
    );
  }
}
