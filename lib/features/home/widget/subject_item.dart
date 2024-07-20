import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/cache/CacheData.dart';

import 'package:quiz_app/features/home/manger/home_page_cubit.dart';
import 'package:quiz_app/features/home/widget/homeBottomSheets/homeAdmintorBottomSheet.dart';
import 'package:quiz_app/features/home/widget/homeMessages/admin_start_quiz_massage.dart';
import 'package:quiz_app/features/home/widget/homeMessages/start_quiz_massage.dart';

class SubjectItem extends StatelessWidget {
   SubjectItem(this.index,{super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit,HomePageState>(builder: (context, state) {
      return InkWell(
        onLongPress: () {
          if(CacheData.getUpgradeAccData(key: "Upgrade")==true){
            showSubjectUpdateBottomSheet(context,
              HomePageCubit.get(context).subjectsObject[index].subjectName,
              HomePageCubit.get(context).subjectsObject[index].id,
              HomePageCubit.get(context).subjectsObject[index].timer,
              HomePageCubit.get(context).subjectsObject[index].subjectImage,
            );
          }
        },
        onTap: () {
          // if(CacheData.getUpgradeAccData(key: "Upgrade")==true){
          //   showAdminStartQuizMassage(context,index,
          //       HomePageCubit.get(context).subjectsObject[index].subjectName,
          //       HomePageCubit.get(context).subjectsObject[index].id,
          //       HomePageCubit.get(context).subjectsObject[index].timer
          //   );

            showStartQuizMassage(context,index,
                HomePageCubit.get(context).subjectsObject[index].subjectName,
                HomePageCubit.get(context).subjectsObject[index].id,
                HomePageCubit.get(context).subjectsObject[index].timer
            );

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
            height: 130.h,
              width: double.infinity,
              fit: BoxFit.fill,),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                HomePageCubit.get(context).subjectsObject[index].subjectName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize:HomePageCubit.get(context).subjectsObject[index].subjectName.length>15?17: 22,
                ),
              ),
            )
          ]),
        ),
      );
    },);
  }
  showStartQuizMassage(BuildContext context, int index,String name,String id,int timer){
    showDialog(context: context, builder: (context) {
      return StartQuizMassage("أنت على وشك بدء اختبار",name,index,name,id,timer);
    },);
  }
  showSubjectUpdateBottomSheet(BuildContext context,String name,String id,int timer,String image){
    showBottomSheet(context: context, builder: (context) {
      return HomeAdmintorBottomSheet(name,id,timer,image);
    },);
  }
  showAdminStartQuizMassage(BuildContext context, int index,String name,String id,int timer){
    showDialog(context: context, builder: (context) {
      return AdminStartQuizMassage("أنت على وشك بدء اختبار",name,index,name,id,timer);
    },);
  }
}
