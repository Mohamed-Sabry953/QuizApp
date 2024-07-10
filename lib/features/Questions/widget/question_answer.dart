import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manger/questions_page_cubit.dart';

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
class QuestionAnswer extends StatelessWidget {
   const QuestionAnswer(this.answer,this.answerNumber,{super.key});
  final String answer;
  final int answerNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsPageCubit,QuestionsPageState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: 15.0),
        child: GestureDetector(
          onTap: () {
            QuestionsPageCubit.get(context).changeAnswerNumber(answerNumber);
            QuestionsPageCubit.get(context).saveStudentAnswer();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GradientText(answer,
                gradient: QuestionsPageCubit.get(context).answerNumber==answerNumber?
                LinearGradient(
                    colors: [Color(0xff3550DC), Color(0xff27E9F7)]):LinearGradient(
                    colors: [Colors.black, Colors.black]),
              ),
              Container(
                margin: REdgeInsets.only(
                    right: 8, left: 8),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    gradient: QuestionsPageCubit
                        .get(context)
                        .answerNumber ==
                        answerNumber
                        ? const LinearGradient(
                      colors: [
                        Color(0xff3550DC),
                        Color(0xff27E9F7)
                      ],
                      begin:
                      Alignment.topLeft,
                      end: Alignment
                          .bottomRight,
                    )
                        : null,
                    color: QuestionsPageCubit.get(
                        context)
                        .answerNumber ==
                        answerNumber
                        ? null
                        : Colors.grey
                        .withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    answerNumber.toString(),
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: QuestionsPageCubit
                            .get(
                            context)
                            .answerNumber ==
                            answerNumber
                            ? Colors.white
                            : Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
}
