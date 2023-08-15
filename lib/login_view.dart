import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_management_web/Constants/ColorConstants.dart';
import 'package:task_management_web/Constants/utils.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: context.isPhone
            ? EdgeInsets.all(Get.width * 0.1)
            : EdgeInsets.all(Get.height * 0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: white,
        ),
        child: Row(
          children: [
            !context.isPhone
                ? Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          bottomLeft: Radius.circular(50.r)),
                      color: blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomizedText(
                              text: "Welcome", size: 70.sp, color: white),
                          CustomizedText(
                              text: "Please Sign In ",
                              size: 30.sp,
                              color: white),
                          CustomizedText(
                              text: "Start Journey With US",
                              size: 20.sp,
                              color: white),
                        ],
                      ),
                    ),
                  ))
                : const SizedBox(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.isPhone
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomizedText(
                                text: "Welcome",
                                size: 32.sp,
                                color: Colors.grey),
                            CustomizedText(
                                text: "Please Sign In ",
                                size: 25.sp,
                                color: Colors.grey),
                            5.verticalSpace,
                            CustomizedText(
                                text: "Start Journey With US",
                                size: 17.sp,
                                color: Colors.grey),
                          ],
                        )
                      : const SizedBox(),
                  Image.asset(
                    "assets/images/login.png",
                    height: Get.height * 0.5,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: CustomizedText(
                        text: "Sign In With Google", color: white),
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: white,
                      size: 20.sp,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
