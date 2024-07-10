import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/home/manger/home_page_cubit.dart';

class SubjectItem extends StatelessWidget {
   SubjectItem(this.index,{super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit,HomePageState>(builder: (context, state) {
      return InkWell(
        onTap: () {
        },
        child: Container(
          margin: EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.red.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomRight: index.isOdd ? Radius.circular(25) : Radius.zero,
                  bottomLeft: index.isEven ? Radius.circular(25) : Radius.zero
              )),
          child: Column(children: [
            Image(image: NetworkImage(HomePageCubit.get(context).subjectsObject[index].subjectImage),
            height: 135.h,
              width: double.infinity,
              fit: BoxFit.fill,),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                HomePageCubit.get(context).subjectsObject[index].subjectName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                ),
              ),
            )
          ]),
        ),
      );
    },);
  }
}
