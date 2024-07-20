import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/core/utils/constant/constantLists.dart';
import 'package:quiz_app/features/home/widget/homeMessages/add_question_dialog.dart';
import 'package:quiz_app/features/home/widget/homeMessages/delete_subject_massage.dart';
import 'package:quiz_app/features/home/widget/homeMessages/update_subject_dialog.dart';

class HomeAdmintorBottomSheet extends StatefulWidget {
   HomeAdmintorBottomSheet(this.subjectName,this.id,this.timer,this.image,{super.key});
   String subjectName;
   String id;
   String image;
   int timer;
  @override
  State<HomeAdmintorBottomSheet> createState() => _HomeAdmintorBottomSheetState();
}
class _HomeAdmintorBottomSheetState extends State<HomeAdmintorBottomSheet> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 2.5,
      color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(top: 12, left: 18.0, right: 18),
            child: Row(
              children: [
                Text(
                  "هل تريد ؟",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 25,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height/20.h,
          ),
          Container(
            height: height / 6.5,
            width: width,
            padding: REdgeInsetsDirectional.only(start: 12,end: 12),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex=index;
                      setState(() {

                      });
                    },
                    child: Container(
                      height:height / 7,
                      width: width/3.5,
                      decoration: BoxDecoration(
                        gradient: currentIndex==index?LinearGradient(
                          colors: [Color(0xff3550DC), Color(0xff27E9F7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ):null,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.black87,width: 1)
                      ),
                      child: Center(
                        child: Text(ConstantLists.updateSubject[index],
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: currentIndex==index?Colors.white:Colors.black87,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w,),
                itemCount: 3),
          ),
          SizedBox(
            height: height/25.h,),
          Padding(
            padding: REdgeInsetsDirectional.only(end: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("الغاء",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black87
                    ),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(100.w, height/13.h)
                  ),
                ),
                SizedBox(width: 12.w,),
                ElevatedButton(
                  onPressed: () {
                    if(currentIndex==0){
                      Navigator.pop(context);
                      showDeleteSubjectMassage(widget.subjectName, widget.id);
                    }
                    else if(currentIndex==1){
                      Navigator.pop(context);
                      showUpdateSubjectDialog(widget.subjectName,widget.id,widget.timer,widget.image);
                    }
                    else if(currentIndex==2){
                      Navigator.pop(context);
                      showAddQuestionDialog(widget.subjectName,widget.id,widget.timer);
                    }
                },
                  child: Text("تأكيد",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white
                ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(100.w, height/13.h)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  showDeleteSubjectMassage(String name,String id){
    showDialog(context: context, builder: (context) {
      return DeleteSubjectMassage("هل تريد حذف مادة", name, name, id);
    },);
  }
  showUpdateSubjectDialog(String name,String id,int timer,String image){
    showDialog(context: context, builder: (context) {
      return UpdateSubjectDialog(name,id,timer,image);
    },);
  }
  showAddQuestionDialog(String name,String id,int timer){
    showDialog(context: context, builder: (context) {
      return AddQuestionDialog(name,id,timer);
    },);
  }
}
