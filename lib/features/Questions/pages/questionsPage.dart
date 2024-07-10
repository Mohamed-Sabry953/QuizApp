import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/change_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_next_question_button.dart';
import 'package:quiz_app/features/Questions/widget/changeQuestionControlItmes/to_previus_question_button.dart';
import 'package:quiz_app/features/Questions/widget/question_answer.dart';
import 'package:quiz_app/features/Questions/widget/questions_number.dart';

class QuestionsPage extends StatelessWidget {
  static const String routeName = "QuestionsPage";

  QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => QuestionsPageCubit()..initState()..getQuestionFromFirebase(),
        child: BlocConsumer<QuestionsPageCubit, QuestionsPageState>(
          builder: (context, state) {
            return state is LoadingDataState
                ? Center(
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
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              REdgeInsets.only(top: 30, right: 24, left: 24),
                          child: Row(
                            children: [
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
                                    Icon(
                                      Icons.timer,
                                      color: Colors.blue,
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
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                "اختبار اللغة العربية",
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 25.sp,
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
                                        REdgeInsetsDirectional.only(end: 15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                  const ToNextQuestionButton(),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  const ChangeQuestionButton(),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  const ToPreviusQuestionButton(),
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
    ));
  }
}
