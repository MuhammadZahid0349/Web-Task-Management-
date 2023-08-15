import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_web/Constants/ColorConstants.dart';
import 'package:task_management_web/Constants/utils.dart';
import 'package:task_management_web/login_view.dart';
import 'package:velocity_x/velocity_x.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomizedText(
                    text: "Task Management", size: 25.sp, color: grey),
                CustomizedText(
                    text: "Manage task made easy with friends",
                    color: grey,
                    size: 15.sp),
              ],
            ),
            const Spacer(flex: 1),
            Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      contentPadding: EdgeInsets.only(left: 40.h, right: 10.h),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: const BorderSide(color: white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: const BorderSide(color: blue)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: black,
                      ),
                      hintText: "Search"),
                )),
            10.w.widthBox,
            const Icon(Icons.notifications),
            20.w.widthBox,
            GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      title: "Sign Out",
                      content:
                          CustomizedText(text: "Are you sure wan to sign out?"),
                      cancel: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: CustomizedText(text: "Cancel")),
                      confirm: ElevatedButton(
                          onPressed: () {
                            Get.to(() => LoginView());
                          },
                          child: CustomizedText(text: "Sign Out")));
                },
                child: CustomizedText(
                    text: "Sign Out",
                    color: black,
                    FontWeight: FontWeight.w800)),
            5.w.widthBox,
            const Icon(Icons.logout_outlined),
          ],
        ),
      ),
    );
  }
}
