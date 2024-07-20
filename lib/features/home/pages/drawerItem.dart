import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/services/contactUs.dart';
import 'package:quiz_app/features/home/pages/privacyPolicy.dart';
import 'package:quiz_app/features/home/widget/homeMessages/upgrade_acc.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsetsDirectional.only(start: width/2.5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(20.r),
          topStart: Radius.circular(20.r),
        )
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height/3.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color(0xff27E9F7),Color(0xff3550DC),],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 90.w,
                        height: 85.h,
                        decoration: const BoxDecoration(
                      color: Colors.white,
                          shape: BoxShape.circle
                        ),),
                    Icon(Icons.account_circle,size: 90.sp,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("User09544",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
                )
              ],
            ),
          ),
          SizedBox(height: 40.h,),
          GestureDetector(
            onTap: () {
              showUpAccMassage(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("حساب مشرف",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
              ),
                SizedBox(width: 10.w,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                    Container(
                      width: 30.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),),
                    Icon(Icons.account_circle,size: 30.sp,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
            ],),
          ),
          SizedBox(height: 45.h,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PrivacyPolicyPage.routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("سياسة الخصوصية",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
              ),
                SizedBox(width: 5.w,),
                    Icon(Icons.safety_check_rounded,size: 30.sp,
                      color: Colors.black.withOpacity(0.5),
                    ),
            ],),
          ),
          SizedBox(height: 45.h,),
          GestureDetector(
            onTap: (){
              ContactUs.sendMail();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("تواصل معنا",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
              ),
                SizedBox(width: 20.w,),
                    Icon(Icons.add_call,size: 30.sp,
                      color: Colors.black.withOpacity(0.5),
                    ),
            ],),
          ),
          Spacer(),
          Padding(
            padding: REdgeInsets.only(bottom: 15.0,right: 10),
            child: Text("v 1.0.0.0",
            style: TextStyle(
              color: Colors.black87.withOpacity(0.3),
              fontSize: 25.sp,
              fontWeight: FontWeight.w700
            ),
            ),
          )
        ],
      ),
    );
  }
  showUpAccMassage(BuildContext context){
    showDialog(context: context, builder: (context) {
      return UpgradeAccount();
    },);
  }
}
