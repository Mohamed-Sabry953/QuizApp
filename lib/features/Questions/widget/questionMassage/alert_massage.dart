import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/home/pages/homePage.dart';

import '../../../home/manger/themeProvider.dart';

class QuestionAlertMassage extends StatelessWidget {
   const QuestionAlertMassage(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    return Center(
      child: Container(
        height: 200.h,
        width: 290.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xff27E9F7),Color(0xff3550DC),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.black,width: 0.7.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Center(
              child: Text(text,
                  style: TextStyle(
                      decorationThickness: 0,
                      fontSize: 18.sp,
                      color: Colors.white,
                    fontWeight: FontWeight.w600
                  )),
            ),
            const Spacer(flex: 2,),
            Container(
              decoration:  BoxDecoration(
              ),
              child: Padding(
                padding: REdgeInsets.only(left: 20.0,right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      },style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 55.h),
                          backgroundColor: Colors.grey,
                          elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                      ), child: Center(
                        child: Text("الغاء",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),),
                    ),
                    SizedBox(width: 25.h,),
                    Expanded(
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, Homepage.routeName, (route) => false,);
                        ConstantLists.degree=0;
                        provider.changeLanguage("ar");

                      },style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)
                        ),
                        fixedSize: Size(double.infinity, 55.h),
                          backgroundColor: Colors.red,
                          elevation: 0.2
                      ), child: Center(
                        child: Text("غلق",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
