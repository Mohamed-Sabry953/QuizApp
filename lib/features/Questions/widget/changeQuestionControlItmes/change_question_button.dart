import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';

class ChangeQuestionButton extends StatelessWidget {
  const ChangeQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsPageCubit,QuestionsPageState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {

          if (QuestionsPageCubit.get(context).questionNumber < QuestionsPageCubit.get(context).question.length - 1)
          {
            QuestionsPageCubit.get(context).answerNumber=QuestionsPageCubit.get(context).studentAnswerNumber[QuestionsPageCubit.get(context).questionNumber+1];
            QuestionsPageCubit.get(context).changeQuestionNumber(QuestionsPageCubit.get(context).questionNumber + 1);
          }
          else{
            showDialog(context);
          }
        },
        child: Container(
          width: 130.w,
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
            child: Text(
              QuestionsPageCubit.get(context)
                  .questionNumber ==
                  QuestionsPageCubit.get(
                      context)
                      .question
                      .length -
                      1
                  ? "انهاء"
                  : "التالى",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white),
            ),
          ),
        ),
      );
    },);
  }
  showDialog(BuildContext context){
    showAdaptiveDialog(context: context, builder: (context) {
      return Container(
        margin: REdgeInsets.only(
          top: 300,
          left: 150,right: 150
        ),
        width: 100.w,
        height: 200.h,
        color: Colors.red,
      );
    },);
  }
}
