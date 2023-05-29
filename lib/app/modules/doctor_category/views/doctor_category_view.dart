// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:hallo_doctor_client/app/models/doctor_category_model.dart';
// import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';
//
// import '../controllers/doctor_category_controller.dart';
//
// class DoctorCategoryView extends GetView<DoctorCategoryController>{
//   Color _selectedContainerColor = Colors.red; // Define your desired color
//   Color _defaultContainerColor = Colors.orange;
//   int selectedCategoryIndex= -1;
//
//
//   Color? _containerColor = Colors.orange[200];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mBackgroundColor,
//         elevation: 0,
//         title: Text(
//           'Doctor Specialist'.tr,
//           style: TextStyle(color: mTitleColor),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: controller.obx((listCategory) => GridView.builder(
//                   itemCount: listCategory!.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 10),
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//
//                         controller.setSelectedCategoryIndex(index);
//                         Get.toNamed('/list-doctor',
//                             arguments: listCategory[index]);
//
//
//                       },
//                       child: Container(
//                           child: Column(
//                         children: [
//                           Expanded(
//                               child: Container(
//                             decoration: BoxDecoration(
//
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                               color: controller. selectedCategoryIndex == index ? _selectedContainerColor : _defaultContainerColor,
//
//                             ),
//                             padding: const EdgeInsets.all(8.0),
//                             child: CachedNetworkImage(
//                                 imageUrl: listCategory[index].iconUrl!),
//                           )),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           FittedBox(
//                             fit: BoxFit.fitWidth,
//                             child: Text(
//                               listCategory[index].categoryName!,
//                               style: doctorCategoryTextStyle,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3,
//                           )
//                         ],
//                       )),
//                     );
//                   })),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/utils/constants/style_constants.dart';

import '../../../utils/styles/styles.dart';
import '../controllers/doctor_category_controller.dart';

class DoctorCategoryView extends GetView<DoctorCategoryController> {
  final RxInt selectedCategoryIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryBlueColor,
        elevation: 0,
        title: Text(
          'Doctor Specialist'.tr,
          style: TextStyle(color: mFillColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: controller.obx((listCategory) => GridView.builder(
                  itemCount: listCategory!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedCategoryIndex.value = index;
                        Get.toNamed('/list-doctor',
                            arguments: listCategory[index]);
                      },
                      child: Obx(() {
                        bool isSelected = selectedCategoryIndex.value == index;
                        return Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: isSelected ? Colors.red[600] : Colors.orange[200],
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(imageUrl: listCategory[index].iconUrl!),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Flexible(
                                child: Text(
                                  listCategory[index].categoryName!,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  style: doctorCategoryTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}