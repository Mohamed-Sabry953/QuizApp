import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/change_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_next_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_previus_question_button.dart';
import 'package:quiz_app/features/Questions/widget/questionMassage/alert_massage.dart';
import 'package:quiz_app/features/Questions/widget/question_answer.dart';
import 'package:quiz_app/features/Questions/widget/questions_number.dart';
import 'package:quiz_app/features/answerAndDgree/widget/answer_item.dart';
import 'package:quiz_app/features/home/data/questionToSubject.dart';
import 'package:quiz_app/features/home/pages/homePage.dart';

class AnswerAndDgreePage extends StatelessWidget {
  static const String routeName = "AnswerPage";
  const AnswerAndDgreePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    var args = ModalRoute.of(context)?.settings.arguments as QuestionToSubject;
    return WillPopScope(
      onWillPop: () {
        return quitQuiz(context);
      },
      child: SafeArea(
          child: Scaffold(
        body: BlocProvider(create: (context) => QuestionsPageCubit()..getQuestionFromFirebase(args.id),
        child: BlocBuilder<QuestionsPageCubit,QuestionsPageState>(
          builder: (context, state) {
            return state is LoadingDataState?
            Center(
              child: CircularProgressIndicator(),
            )
            :Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff3550DC), Color(0xff27E9F7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:Column(
                children: [
                  Padding(
                    padding:
                    REdgeInsets.only(top: 20, right: 24, left: 24),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            quitQuiz(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "نتيجة اختبار ${args.subjectName} ",
                          style: TextStyle(
                              fontSize: 21.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.98),
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(35.r),
                              topStart: Radius.circular(35.r),
                            )),
                        child: Column(
                          children: [
                            Container(
                              margin: REdgeInsets.only(top: 25),
                              width: 55.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff3550DC),
                                    Color(0xff27E9F7)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius:
                                BorderRadiusDirectional.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  margin: REdgeInsetsDirectional.only(end: 20),
                                  width: 85.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                  color:ConstantLists.degree>=ConstantLists.questions.length/2? Colors.green.shade500:Colors.red,
                                    borderRadius: BorderRadius.circular(12.r)
                                  ),
                                  child: Center(child: Text("${ConstantLists.degree}/${ConstantLists.questions.length}",
                                  style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            QuestionsNumber(),
                            SizedBox(
                              height: 15.h,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                  REdgeInsetsDirectional.only(start: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        ConstantLists.questions[QuestionsPageCubit.get(context).questionNumber].question,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Answer_item(
                                    ConstantLists.questions[QuestionsPageCubit.get(context).questionNumber].firstAnswer, 1),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Answer_item(
                                    ConstantLists.questions[QuestionsPageCubit.get(context).questionNumber].secondAnswer, 2),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Answer_item(
                                    ConstantLists.questions[QuestionsPageCubit.get(context).questionNumber].thirdAnswer, 3),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Answer_item(
                                    ConstantLists.questions[QuestionsPageCubit.get(context).questionNumber].fourAnswer, 4),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding:  REdgeInsets.only(left: 40.0,right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const ToPreviusQuestionButton(),
                                  Spacer(flex: 2,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(context, Homepage.routeName, (route) => false,);
                                      ConstantLists.degree=0;
                                    },
                                    child: Container(
                                      width: 140.w,
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12.r),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xff3550DC),
                                              Color(0xff27E9F7)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border:
                                          Border.all(color: Colors.blue)),
                                      child: Center(
                                        child: Text("الصفحة الرئيسية",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),),),),
                                  )
                                      ,
                                  Spacer(flex: 2,),
                                  const ToNextQuestionButton(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
        ),
        ),
      )),
    );
  }
  quitQuiz(BuildContext context){
    showDialog(context: context, builder: (context) {
      return QuestionAlertMassage("هل تريد الخروج من الاختبار؟");
    },);
  }
}
