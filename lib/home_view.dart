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
                  const header(),
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
                            : BorderRadius.circular(20.r)),
                  ))
                ],
              )),
        ],
      ),
    );
  }
}
