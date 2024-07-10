import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/home/manger/home_page_cubit.dart';
import 'package:quiz_app/features/home/pages/drawerItem.dart';
import 'package:quiz_app/features/home/widget/homeMessages/alert_massage.dart';
import 'package:quiz_app/features/home/widget/subject_item.dart';
import 'package:quiz_app/features/home/widget/theme_button.dart';

class Homepage extends StatelessWidget {
  static const String routeName = "HomePage";

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showmessage(context);
      },
      child: SafeArea(
        child: Scaffold(
          drawer: DrawerItem(),
          body: BlocProvider(create: (context) => HomePageCubit()..getSubjectFromFirebase(),
          child: BlocConsumer<HomePageCubit,HomePageState>(
            builder: (context, state) {
              return Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    Container(
                      padding: REdgeInsets.only(left: 15, right: 15),
                      width: double.infinity,
                      height: 90.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff3550DC), Color(0xff27E9F7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(60.r),
                              bottomStart: Radius.circular(60.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: ImageIcon(
                              AssetImage("assets/images/listIcon.png"),
                              color: Colors.white,
                              size: 40.sp,
                            ),
                          ),
                          Text(
                            "تكاتف التعليمى",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(height: 50.h, width: 50.w, child: const ThemeButton()),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {

                              },
                                child: SubjectItem(index));
                          },
                          itemCount: HomePageCubit.get(context).subjectsObject.length,
                        ))
                  ],
                ),
              );
            },
            listener: (context, state) {

            },
          ),
          ),
        ),
      ),
    );
  }
  showmessage(BuildContext context){
    showDialog(context: context, builder: (context) {
      return AlertMassage("هل تريد الخروج من البرنامج؟");
    },);
  }
}
