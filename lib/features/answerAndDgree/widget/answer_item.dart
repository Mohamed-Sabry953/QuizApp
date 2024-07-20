import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';


class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;

  GradientText(this.text, {required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white,
        fontSize: 22.sp,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
class Answer_item extends StatelessWidget {
   const Answer_item(this.answer,this.answerNumber,{super.key});
  final String answer;
  final int answerNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsPageCubit,QuestionsPageState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: REdgeInsetsDirectional.only(
                  start: 25, end: 10),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].trueAnswer==answerNumber? CupertinoColors.activeGreen
                      :
                  ConstantLists.answer[QuestionsPageCubit.get(context).questionNumber]!=QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].trueAnswer
                  && ConstantLists.answer[QuestionsPageCubit.get(context).questionNumber]==answerNumber?
                  Colors.red:Colors.grey.withOpacity(0.4),
                  shape: BoxShape.circle),
              child: Center(
                child: Text(
                  answerNumber.toString(),
                  style: TextStyle(
                      fontSize: 17.sp,
                      color:   Colors.black),
                ),
              ),
            ),
            Text(answer,
              style: TextStyle(
                fontSize: 22.sp,
                color: QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].trueAnswer==answerNumber? CupertinoColors.activeGreen
                    :
                ConstantLists.answer[QuestionsPageCubit.get(context).questionNumber]!=QuestionsPageCubit.get(context).question[QuestionsPageCubit.get(context).questionNumber].trueAnswer
                    && ConstantLists.answer[QuestionsPageCubit.get(context).questionNumber]==answerNumber?
                Colors.red:Colors.black
              ),
            )
          ],
        ),
      );
    },);
  }
}
