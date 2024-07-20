import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/home/manger/home_page_cubit.dart';

class AddQuestionDialog extends StatefulWidget {
  AddQuestionDialog(this.name, this.id, this.timer, {super.key});

  String name;
  String id;
  int timer;

  @override
  State<AddQuestionDialog> createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<AddQuestionDialog> {
  TextEditingController question = TextEditingController();
  TextEditingController answerOne = TextEditingController();
  TextEditingController answerTwo = TextEditingController();
  TextEditingController answerThree = TextEditingController();
  TextEditingController answerFour = TextEditingController();
  TextEditingController trueAnswer = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("السؤال :",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 8.h,
                                      width: width / 1.7,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        validator: (value) {
                                          if (question.text.length <= 10) {
                                            return "ادخل السؤال بشكل صحيح";
                                          }
                                          return null;
                                        },
                                        controller: question,
                                        maxLines: 3,
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
                                    Text("الاجابة الأولى :",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 1.6,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        controller: answerOne,
                                        validator: (value) {
                                          if (answerOne
                                              .toString()
                                              .length < 1) {
                                            return "ادخل ادخل الاجابه صحيحية";
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
                                    Text("الاجابة التانيه :",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 1.6,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        controller: answerTwo,
                                        validator: (value) {
                                          if (answerTwo
                                              .toString()
                                              .length < 2) {
                                            return "ادخل ادخل الاجابه صحيحية";
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
                                    Text("الاجابة الثالثة :",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 1.6,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        controller: answerThree,
                                        validator: (value) {
                                          if (answerTwo
                                              .toString()
                                              .length < 2) {
                                            return "ادخل ادخل الاجابه صحيحية";
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
                                    Text("الاجابة الرابعة :",
                                      style: TextStyle(
                                          fontSize: 20.sp
                                      ),
                                    ),
                                    Container(
                                      height: height / 11.h,
                                      width: width / 1.6,
                                      margin: REdgeInsets.only(
                                          right: 10, left: 10, top: 8),
                                      child: TextFormField(
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        controller: answerFour,
                                        validator: (value) {
                                          if (answerTwo
                                              .toString()
                                              .length < 2) {
                                            return "ادخل ادخل الاجابه صحيحية";
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
                                    Text("رقم الاجابة الصحيحة :",
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
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 18.sp,
                                            color: Colors.black87),
                                        controller: trueAnswer,
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        validator: (value) {
                                          if (trueAnswer.text.length < 1) {
                                            return "ادخل الاجابة الصحيحة";
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
                                                    .addQuestionToFirebase(
                                                    question.text,
                                                    widget.id,
                                                    answerOne.text,
                                                    answerTwo.text,
                                                    answerThree.text,
                                                    answerFour.text,
                                                    int.parse(trueAnswer.text),
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
