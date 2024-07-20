import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/home/manger/home_page_cubit.dart';

class UpdateSubjectDialog extends StatefulWidget {
  UpdateSubjectDialog(this.name, this.id, this.timer, this.image, {super.key});

  String name;
  String id;
  String image;
  int timer;

  @override
  State<UpdateSubjectDialog> createState() => _UpdateSubjectDialogState();
}

class _UpdateSubjectDialogState extends State<UpdateSubjectDialog> {
  TextEditingController subjectName = TextEditingController();

  TextEditingController time = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    subjectName.text=widget.name;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(create: (context) => HomePageCubit(),
        child: BlocConsumer<HomePageCubit, HomePageState>(
          builder: (context, state) {
            return Form(
                key: formkey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      height: height / 1.3.h,
                      width: 290.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.7.w),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: REdgeInsetsDirectional.only(
                            start: 12.0, end: 12, top: 12, bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("اسم المادة:",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 1.7,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                          widget.name=value;
                                          });
                                        },
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        initialValue: widget.name,
                                        validator: (value) {
                                          if (widget.name.length <= 3) {
                                            return "ادخل اسم المادة صحيح";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("الوقت بالثوانى:",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 3,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                          widget.timer=int.parse(value);
                                          });
                                        },
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                          initialValue: widget.timer.toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (widget.timer.toString().length<2) {
                                            return "ادخل الوقت صحيح";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18.r)),
                                            borderSide:
                                            const BorderSide(width: 1.5,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("الصورة التعبيرية:",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 4.h,
                                      width: width / 1.4.w,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(widget.image),
                                              fit: BoxFit.fitWidth),
                                          border: Border.all(
                                              color: Colors.black87, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              18.r)
                                      ),
                                    ),
                                    SizedBox(height: height / 15.h,),
                                    Padding(
                                      padding: REdgeInsetsDirectional.only(
                                          end: 8.0),
                                      child: Row(
                                        children: [
                                          SizedBox(width: width / 7.w,),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("الغاء",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black87
                                              ),),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.2),
                                                fixedSize: Size(80.w, 50.h)
                                            ),
                                          ),
                                          SizedBox(width: 12.w,),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                HomePageCubit.get(context)
                                                    .updateUserFirebaseData(
                                                    widget.name, widget.id, widget.timer,
                                                    context);
                                              }
                                            },
                                            child: Text("تأكيد",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white
                                              ),),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                fixedSize: Size(80.w, 50.h)
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }, listener: (context, state) {

        },),
      ),
    );
  }
}
