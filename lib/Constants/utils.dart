import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ColorConstants.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 40.0
    ..radius = 15.0
    ..progressColor = MColor.withOpacity(0.5)
    ..backgroundColor = MColor.withOpacity(0.7)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..textStyle = const TextStyle(fontSize: 22, fontStyle: FontStyle.italic)
    ..maskColor = Colors.grey.withOpacity(0.7)
    ..userInteractions = true
    ..maskType = EasyLoadingMaskType.custom
    ..dismissOnTap = false;
}

GestureDetector BackBtn(Color iconcolor) {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 6.w),
      height: 36.h,
      width: 36.w,
      decoration: BoxDecoration(
        color: KSecColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Icon(
        Icons.arrow_back_ios,
        color: iconcolor,
        size: 25.sp,
      ),
    ),
  );
}

CustomizedSnackBar(var title, var message) {
  Get.snackbar("$title", "$message",
      colorText: MColor,
      borderRadius: 20.r,
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      animationDuration: const Duration(milliseconds: 500),
      // backgroundGradient: const LinearGradient(colors: [Colors.white, white]),
      borderWidth: 4,
      forwardAnimationCurve: Curves.bounceInOut,
      backgroundColor: Colors.white.withOpacity(0.8),
      duration: const Duration(milliseconds: 3000), // visible Time
      icon: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Image.asset(
          "assets/a.png",
        ),
      ));
}

////////// Text /////////////////////
Widget CustomizedText(
    {text, size, FontWeight, color, textalign, double? btwSpace}) {
  return Text(text,
      softWrap: true,
      textAlign: textalign ?? TextAlign.center,
      style: GoogleFonts.josefinSans(
          color: color ?? MColor,
          fontWeight: FontWeight,
          fontSize: size,
          letterSpacing: btwSpace ?? 1));
}

Container CustomziedButton({text, onFunction}) {
  return Container(
    height: 46.h,
    width: 295.w,
    child: ElevatedButton(
        onPressed: onFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: MColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: CustomizedText(
            text: text,
            size: 16.sp,
            FontWeight: FontWeight.w700,
            color: Colors.white,
            btwSpace: 7)),
  );
}

/////// For Loader Time
// startTime() async {
//   Get.to(() => Loader());
//   // Navigator.push(context, MaterialPageRoute(builder: (context) => Loader()));
//   await Future.delayed(const Duration(seconds: 3));
//   // Navigator.pushReplacement(
//   //     context, MaterialPageRoute(builder: (context) => ViewReportScreen()));
//   Get.off(() => ViewReportScreen());
// }


//  Text('Login',
//                     style: GoogleFonts.josefinSans(
//                       color: MColor,
//                       fontWeight: FontWeight.w900,
//                       fontSize: 35.sp,
//                     )),