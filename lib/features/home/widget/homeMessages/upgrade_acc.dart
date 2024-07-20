import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/cache/CacheData.dart';

class UpgradeAccount extends StatelessWidget {
  UpgradeAccount({super.key});

  final TextEditingController upAccCode = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
          key: formkey,
          child: Center(
        child: Container(
          height: 230.h,
          width: 290.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff27E9F7),
                Color(0xff3550DC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.black, width: 0.7.w),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Column(
                children: [
                  Text(
                    'ادخل كود التطوير',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'San Francisco Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    margin: REdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      controller: upAccCode,
                      validator: (value) {
                        if (upAccCode.text != "UI1500SI21") {
                          return "ادخل كود صحيح";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.r)),
                          borderSide:
                          const BorderSide(width: 1.5, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.r)),
                          borderSide:
                          const BorderSide(width: 1.5, color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.r)),
                          borderSide:
                          const BorderSide(width: 1.5, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: REdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 55.h),
                            backgroundColor: Colors.grey,
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                          ),
                          child: Center(
                            child: Text(
                              "الغاء",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await CacheData.setUpgradeAccData(key: "Upgrade", value: true);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              // Display the Snackbar
                              final snackBar = SnackBar(
                                backgroundColor: Colors.green,
                                content: const Text('تم تحويل حسابك الى حساب مشرف',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                ),
                                action: SnackBarAction(
                                  label: 'اخفاء',
                                  textColor: Colors.red,
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              // Find the ScaffoldMessenger in the widget tree and use it to show a SnackBar.
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              fixedSize: Size(double.infinity, 55.h),
                              backgroundColor: Colors.green,
                              elevation: 0.2),
                          child: Center(
                            child: Text(
                              "تطوير",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
