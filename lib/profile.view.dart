import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_management_web/Constants/ColorConstants.dart';
import 'package:task_management_web/Constants/utils.dart';
import 'package:task_management_web/friend_view.dart';
import 'package:task_management_web/header.dart';
import 'package:task_management_web/login_view.dart';
import 'package:task_management_web/profile.view.dart';
import 'package:task_management_web/sidebar_view.dart';
import 'package:task_management_web/task_view.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBarView(),
      backgroundColor: Colors.blue[100],
      body: Row(
        children: [
          !context.isPhone
              ? const Expanded(flex: 2, child: SideBarView())
              : const SizedBox(),
          Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _drawerKey.currentState!.openDrawer();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: grey,
                                  )),
                              15.w.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomizedText(
                                      text: "Task Management",
                                      size: 18.sp,
                                      color: grey),
                                  CustomizedText(
                                      text:
                                          "Manage task made easy with friends",
                                      color: grey,
                                      size: 10.sp),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.notifications,
                                color: grey,
                                size: 30.sp,
                              ),
                              15.w.widthBox,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  foregroundImage: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_640.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(30),
                    margin: !context.isPhone
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50.r)
                            : BorderRadius.circular(30.r)),
                  ))
                ],
              )),
        ],
      ),
    );
  }
}
