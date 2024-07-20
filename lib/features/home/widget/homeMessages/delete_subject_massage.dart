import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/services/firebaseManger.dart';
import 'package:quiz_app/features/Questions/pages/questionsPage.dart';
import 'package:quiz_app/features/home/data/questionToSubject.dart';

class DeleteSubjectMassage extends StatelessWidget {
  DeleteSubjectMassage(this.text,this.textTwo, this.name, this.id, {super.key});
  String text;
  String textTwo;
  String name;
  String id;
  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Text(textTwo,
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
                      child: ElevatedButton(onPressed: () async {
                         FirebaseManger.deleteSubject(context, id);
                      },style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)
                        ),
                        fixedSize: Size(double.infinity, 55.h),
                          backgroundColor: Colors.red.withOpacity(0.8),
                          elevation: 0.2
                      ), child: Center(
                        child: Text("حذف",
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
