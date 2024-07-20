import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/features/home/manger/home_page_cubit.dart';
import 'package:quiz_app/features/home/pages/drawerItem.dart';
import 'package:quiz_app/features/home/widget/homeMessages/add_subject_dialog.dart';
import 'package:quiz_app/features/home/widget/homeMessages/alert_massage.dart';
import 'package:quiz_app/features/home/widget/subject_item.dart';

class Homepage extends StatelessWidget {
  static const String routeName = "HomePage";

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: () {
        return showmessage(context);
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: DrawerItem(),
          body: BlocProvider(
            create: (context) => HomePageCubit()..getSubjectFromFirebase(),
            child: BlocConsumer<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: ()async {
                    HomePageCubit.get(context).subjectsObject=[];
                    await HomePageCubit.get(context).getSubjectFromFirebaseRefresh();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.white60,
                      image: const DecorationImage(image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.fill
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: REdgeInsets.only(left: 15, right: 15),
                              width: double.infinity,
                              height: height/9.h,
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
                                  Container(
                                      height: 50.h,
                                      width: 50.w,
                                      child: GestureDetector(
                                          onTap: () {
                                            showmessage(context);
                                          },
                                          child: const Icon(Icons.arrow_back,size: 29,color: Colors.white,))),
                                  Text(
                                    "تكاتف التعليمية",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height/70.h,
                            ),
                          ],
                        ),
                        Container(
                          height: height/1.21.h,
                          child: CustomScrollView(
                            scrollDirection: Axis.vertical,
                            slivers: [
                              SliverGrid(
                                  delegate: SliverChildBuilderDelegate(
                                childCount: HomePageCubit.get(context).subjectsObject.length,
                                (context, index) {
                                  return SubjectItem(index);
                                },
                              ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
                              SliverToBoxAdapter(
                                child: Visibility(
                                  visible: HomePageCubit.get(context).accCheck,
                                  child: GestureDetector(
                                    onTap: () {
                                      showAddSubjectMassage(context);
                                    },
                                    child: Container(
                                      margin: REdgeInsetsDirectional.only(start: 10,end: 10,top: 5,bottom: 5),
                                      width: double.infinity,
                                      height: height/6.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.25),
                                        border: Border.all(style: BorderStyle.solid,color: Colors.green,width: 1.8),
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Icon(CupertinoIcons.plus,
                                              size: 60.sp,
                                                color: Colors.black.withOpacity(0.45),
                                              )),
                                          Text("اضافة مادة جديدة",
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22.sp
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if(state is LoadingDataRefreshState){
                  showDialog(context: context, builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },);
                }
                else if(state is GetDataSucRefreshState){
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  showmessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertMassage("هل تريد الخروج من البرنامج؟");
      },
    );
  }
  showAddSubjectMassage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddSubjectDialog();
      },
    );
  }
}
