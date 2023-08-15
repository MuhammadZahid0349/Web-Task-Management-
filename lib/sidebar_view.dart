import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_management_web/Constants/ColorConstants.dart';
import 'package:task_management_web/Constants/utils.dart';
import 'package:task_management_web/friend_view.dart';
import 'package:task_management_web/home_view.dart';
import 'package:task_management_web/profile.view.dart';
import 'package:task_management_web/task_view.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        height: Get.height,
        color: Colors.blue[100],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 150.h,
                width: Get.width,
                child: Image.asset(
                  "assets/images/wlogo.png",
                  fit: BoxFit.cover,
                ),
              ),
              25.verticalSpace,
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    Get.to(() => HomeView());
                  },
                  child: iconButton("Home", FontAwesomeIcons.desktop, 0)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Get.to(() => TaskView());
                  },
                  child: iconButton("Task", FontAwesomeIcons.cube, 1)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Get.to(() => FriendView());
                  },
                  child: iconButton("Friends", FontAwesomeIcons.heart, 2)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    Get.to(() => ProfileView());
                  },
                  child: iconButton("Profile", Icons.person, 3)),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox iconButton(String text, IconData icon, int index) {
    return SizedBox(
      height: 100.h,
      child: Center(
        child: Column(
          children: [
            Container(
              height: 40.h,
              width: 25.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color:
                    _selectedIndex == index ? Colors.white : Colors.transparent,
              ),
              child: Icon(
                icon,
                color: grey,
                size: 25.sp,
              ),
            ),
            5.verticalSpace,
            CustomizedText(text: "$text", color: grey)
          ],
        ),
      ),
    );
  }
}
