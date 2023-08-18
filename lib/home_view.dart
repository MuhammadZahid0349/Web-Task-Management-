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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                            5.w.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomizedText(
                                    text: "Task Management",
                                    size: 15.sp,
                                    color: grey),
                                CustomizedText(
                                    text: "Manage task made easy with friends",
                                    color: grey,
                                    size: 8.sp),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.notifications,
                              color: grey,
                              size: 30.sp,
                            ),
                            10.w.widthBox,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizedText(
                            text: "My Task", size: 30.sp, color: grey),
                        10.verticalSpace,
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 6, // Number of taskDetails widgets
                            itemBuilder: (context, index) {
                              return taskDetails();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container taskDetails() {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.brown.shade100),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 20,
                  foregroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_640.png"),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 20,
                  foregroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_640.png"),
                ),
              ),
              const Spacer(),
              FittedBox(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r), color: bgBlue),
                  child: Center(
                    child:
                        CustomizedText(text: "100%", color: grey, size: 17.sp),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          FittedBox(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              height: 30.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r), color: bgBlue),
              child: CustomizedText(
                  text: "10 / 10 Task", size: 12.sp, color: grey),
            ),
          ),
          10.h.heightBox,
          CustomizedText(text: "Mobile Development", size: 20.sp, color: grey),
          CustomizedText(text: "Dead Line", size: 15.sp, color: grey)
        ],
      ),
    );
  }
}
