import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/appointment/views/appointment_view.dart';
import 'package:hallo_doctor_client/app/modules/doctor_category/views/doctor_category_view.dart';
import 'package:hallo_doctor_client/app/modules/home/views/home_view.dart';
import 'package:hallo_doctor_client/app/modules/list_chat/views/list_chat_view.dart';
import 'package:hallo_doctor_client/app/modules/profile/views/profile_view.dart';
import 'package:hallo_doctor_client/app/utils/styles/styles.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final List<Widget> bodyContent = [
    HomeView(),
    DoctorCategoryView(),
    AppointmentView(),
    ListChatView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/astrocall-logo1.png"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Styles.secondaryBlueColor,
            unselectedItemColor: Colors.red[300],
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Styles.primaryBlueColor,
                  ),
                  label: "Home".tr),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.contacts,
                    color: Styles.primaryBlueColor,
                  ),
                  label: "Doctor".tr),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_camera_front,
                    color: Styles.primaryBlueColor,
                  ),
                  label: "Appointment".tr),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    color: Styles.primaryBlueColor,
                  ),
                  label: "Chat".tr),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Styles.primaryBlueColor,
                  ),
                  label: "Profile".tr),
            ],
            currentIndex: controller.selectedIndex,
            onTap: (index) {
              controller.selectedIndex = index;
            },
          )),
      body: Obx(
        () => Center(
          child: IndexedStack(
              index: controller.selectedIndex, children: bodyContent),
        ),
      ),
    );
  }
}
