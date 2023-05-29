import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';
import 'package:intl/intl.dart';
final UserService userService = Get.find();
late DateTime newDateTime;
late DateTime initialTime;
var time=TimeOfDay.fromDateTime(DateTime.now());


class ProblemService {
  Future sendProblem(String myProblem, TimeSlot timeSlot) async {
    print("inside timeSlot");
    print(time);
    String now = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
    print(now);
    initialTime =DateTime.now();
         newDateTime = initialTime;
    newDateTime.toLocal();
    //print(userService.currentUser!.displayName);
    try {
      await FirebaseFirestore.instance
          .collection('Problem')
          .add({
        'problem': myProblem,
        'timeSlot': timeSlot.id,
         'Astro_name':timeSlot.doctor!.doctorName,
         'Astro_id':timeSlot.doctorid,
       // 'client_name':timeSlot.bookByWho!.

         'Client_name':userService.currentUser!.displayName,
         'Client_id':userService.currentUser!.uid,
        'Time_of_call':initialTime


          });
    } on FirebaseException catch (e) {
      return Future.error(e.message!);
    }
  }
}
