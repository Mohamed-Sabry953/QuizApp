import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';
import 'package:quiz_app/features/Questions/widget/questionMassage/end_quiz_massage.dart';

class ChangeQuestionButton extends StatelessWidget {
   ChangeQuestionButton(this.name,this.id,this.index,this.timer,{super.key});
  String name;
  String id;
  int index;
  int timer;
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
            ConstantLists.questions=QuestionsPageCubit.get(context).question;
            ConstantLists.answer=QuestionsPageCubit.get(context).studentAnswerNumber;
            showDialog(context,name,index,id,timer);
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
  showDialog(BuildContext context,String name,int index,String id,int timer){
    showAdaptiveDialog(context: context, builder: (context) {
      return EndQuizMassage("هل تريد انهاء اختبار ", name, index,name,id,timer);
    },);
  }
}
