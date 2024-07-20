import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';

class ToPreviusQuestionButton extends StatelessWidget {
  const ToPreviusQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsPageCubit,QuestionsPageState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          if (QuestionsPageCubit.get(context).questionNumber > 0) {
          QuestionsPageCubit.get(context).answerNumber=QuestionsPageCubit.get(context).studentAnswerNumber[QuestionsPageCubit.get(context).questionNumber-1];
            QuestionsPageCubit.get(context).changeQuestionNumber(QuestionsPageCubit.get(context).questionNumber - 1);
          }
        },
        child: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
              gradient: QuestionsPageCubit.get(
                  context)
                  .questionNumber ==
                  0
                  ? const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.grey
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  : const LinearGradient(
                colors: [
                  Color(0xff3550DC),
                  Color(0xff27E9F7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 30.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5.w,),
            ],
          ),
        ),
      );
    },);
  }
}
