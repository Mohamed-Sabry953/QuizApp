import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/Questions/manger/questions_page_cubit.dart';

class QuestionsNumber extends StatelessWidget {
   QuestionsNumber({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsPageCubit,QuestionsPageState>(builder: (context, state) {
      return SizedBox(
        height: 70.h,
        width: double.infinity.w,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2,
                                color: QuestionsPageCubit
                                    .get(
                                    context)
                                    .questionNumber ==
                                    index
                                    ? Colors
                                    .blueAccent
                                    : Colors.grey
                                    .withOpacity(
                                    0.3)))),
                    child: Column(
                      children: [
                        Container(
                          margin: REdgeInsets.only(
                              right: 8, left: 8),
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              gradient: QuestionsPageCubit.get(context).questionNumber == index
                                  ? const LinearGradient(
                                colors: [
                                  Color(0xff3550DC),
                                  Color(0xff27E9F7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,) : null,
                              color: QuestionsPageCubit.get(context).questionNumber == index ? null :QuestionsPageCubit.get(context).studentAnswerNumber[index]>=0? Colors.green:Colors.grey.withOpacity(0.3),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: QuestionsPageCubit.get(
                                      context)
                                      .questionNumber ==
                                      index ||QuestionsPageCubit.get(context).studentAnswerNumber[index]>=0
                                      ? Colors.white
                                      : Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 0.w,
              );
            },
            itemCount: QuestionsPageCubit.get(context)
                .question
                .length),
      );
    },);
  }
}
