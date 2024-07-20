import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/utils/themeData/colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String routeName = "PrivacyPolicyPage";

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsetsDirectional.only(top: 25, start: 10, end: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color:AppColors.DarkColor,
                    ),
                  ),
                  Text(
                    "سياسة الخصوصية",
                    style: GoogleFonts.notoKufiArabic(
                        color:AppColors.DarkColor, fontSize: 22.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Divider(
                    color: AppColors.DarkColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "نحن في تكاتف التعليمية نلتزم بحماية خصوصيتك وضمان عدم جمع أو استخدام أي معلومات شخصية. توضح هذه السياسة كيفية تعاملنا مع بياناتك لضمان تجربة آمنة ومحمية.*",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "المعلومات غير الشخصية: عند استخدامك للتطبيق، قد نجمع بيانات غير شخصية تتعلق بكيفية استخدامك للتطبيق مثل نوع الجهاز، نظام التشغيل، اللغة المفضلة، والأوقات التي تستخدم فيها التطبيق. هذه البيانات تُجمع بهدف تحسين تجربة المستخدم وتطوير التطبيق *",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "استخدام المعلومات: نستخدم المعلومات غير الشخصية التي نجمعها لتحسين خدماتنا وتخصيص تجربتك مع التطبيق.قد نحلل الأنماط والاستخدامات لتحسين واجهة المستخدم والأداء الفني للتطبيق. *",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "حماية المعلومات : نتخذ تدابير أمنية مناسبة لحماية بياناتك من الوصول غير المصرح به أو التعديل أو الكشف أو التدمير.نستخدم تقنيات الأمان مثل التشفير لضمان حماية المعلومات أثناء التخزين. *",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "حقوقك: على الرغم من أننا لا نجمع معلومات شخصية، لديك الحق في الاستفسار عن أي بيانات قد تكون قد جمعت أثناء استخدامك للتطبيق. يمكن التواصل معنا عبر example@gmail.com لأي استفسارات.",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "التغييرات على سياسة الخصوصية: قد نقوم بتحديث هذه السياسة من وقت لآخر. سنعلمك بأي تغييرات من خلال نشر السياسة الجديدة على هذه الصفحة. ننصح بمراجعة هذه السياسة بانتظام لضمان معرفتك بأي تحديثات. *",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "التواصل معنا:إذا كانت لديك أي أسئلة أو استفسارات حول هذه السياسة أو حول ممارسات الخصوصية لدينا، يرجى التواصل معنا عبر example@gmail.com . *",
                    style: GoogleFonts.notoKufiArabic(
                        color: AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "باستخدامك لتطبيقنا، فإنك توافق على سياسة الخصوصية هذه. إذا كنت لا توافق على أي جزء من هذه السياسة، نرجو منك عدم استخدام التطبيق. *",
                    style: GoogleFonts.notoKufiArabic(
                        color:AppColors.DarkColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
