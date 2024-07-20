import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/change_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_next_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_previus_question_button.dart';
import 'package:quiz_app/features/Questions/widget/questionMassage/alert_massage.dart';
import 'package:quiz_app/features/Questions/widget/questionMassage/delete_question_massage.dart';
import 'package:quiz_app/features/Questions/widget/question_answer.dart';
import 'package:quiz_app/features/Questions/widget/questions_number.dart';
import 'package:quiz_app/features/home/data/questionToSubject.dart';

class QuestionsPage extends StatelessWidget {
  static const String routeName = "QuestionsPage";
  const QuestionsPage({super.key});

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
        body: BlocProvider(
          create: (context) => QuestionsPageCubit()..initState(
            args.subjectName,
            args.id,
            args.timer,
            context
          )..getQuestionFromFirebase(
            args.id
          ),
          child: BlocConsumer<QuestionsPageCubit, QuestionsPageState>(
            builder: (context, state) {
              return state is LoadingDataState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff3550DC), Color(0xff27E9F7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child:QuestionsPageCubit.get(context).question.isEmpty? Center(
                        child: Text("لم يتم اضافة أى أسئله بعد",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp
                        ),
                        ),
                      ):Column(
                        children: [
                          Padding(
                            padding:
                                REdgeInsets.only(top: 30, right: 24, left: 24),
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
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "اختبار ${args.subjectName}",
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                Container(
                                  width: 80.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadiusDirectional.circular(40.r)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        QuestionsPageCubit.get(context)
                                            .formatDuration(Duration(
                                            seconds: QuestionsPageCubit.get(
                                                context)
                                                .timerNum)),
                                        style: TextStyle(
                                            fontSize: 12.sp, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      const Icon(
                                        Icons.timer,
                                        color: Colors.blue,
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
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
                                Padding(
                                  padding: REdgeInsetsDirectional.only(end: 18.0,top: 18),
                                  child: Visibility(
                                    visible: QuestionsPageCubit.get(context).accCheck,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () async {
                                             showDeleteQuestionMassage(context,
                                                 QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].id,
                                                 (){
                                                   QuestionsPageCubit.get(context).question.removeAt(QuestionsPageCubit.get(context).questionNumber);
                                                 }
                                             );
                                          },style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.r)
                                            ),
                                            fixedSize: Size(double.infinity, 55.h),
                                            backgroundColor: Colors.red.withOpacity(0.8),
                                            elevation: 0.2
                                        ), child: Center(
                                          child: Text(" حذف السؤال",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
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
                                            QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].question,
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
                                    QuestionAnswer(
                                        QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].firstAnswer, 1),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    QuestionAnswer(
                                        QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].secondAnswer, 2),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    QuestionAnswer(
                                        QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].thirdAnswer, 3),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    QuestionAnswer(
                                        QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].fourAnswer, 4),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const ToPreviusQuestionButton(),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                     ChangeQuestionButton(args.subjectName,args.id,0,args.timer),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    const ToNextQuestionButton(),
                                  ],
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
            listener: (context, state) {},
          ),
        ),
      )),
    );
  }
  quitQuiz(BuildContext context){
    showDialog(context: context, builder: (context) {
      return const QuestionAlertMassage("هل تريد الخروج من الاختبار؟");
    },);
  }
  showDeleteQuestionMassage(BuildContext context,String id,Function removeQuestion){
    showDialog(context: context, builder: (context) {
      return DeleteQuestionMassage("هل تريد حذف هذا السؤال ؟", id,removeQuestion);
    },);
  }
}
