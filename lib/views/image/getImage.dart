import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profileui/controllers/imagePickerController.dart';

class FetchImage extends StatelessWidget {
  final controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              FetchAvatar(),
              Spacer(),
              MaterialButton(
                height: Get.size.height * 0.06,
                color: Colors.blueAccent,
                minWidth: Get.size.width * 0.7,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.size.height * 0.015),
                ),
                onPressed: () {
                  controller.imagefromDb();
                },
                child: Text(
                  "Fetch Image",
                  style: TextStyle(
                    fontSize: Get.size.height * 0.022,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class FetchAvatar extends StatelessWidget {
  final controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      shape: CircleBorder(),
      child: Container(
        padding: EdgeInsets.all(Get.size.height * 0.003),
        child: Obx(() => CircleAvatar(
              radius: Get.size.height * 0.09,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: controller.dbImage.isNotEmpty
                  ? MemoryImage(
                      base64Decode(controller.dbImage.value),
                    )
                  : null,
            )),
      ),
    );
  }
}
