import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profileui/controllers/imagePickerController.dart';
import 'package:profileui/views/image/getImage.dart';

class HomePage extends StatelessWidget {
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
              ProfileAvatar(),
              SizedBox(height: size.height * 0.04),
              Text(
                "Your profile is empty!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: size.height * 0.025,
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Obx(
                () => Text(
                  controller.image.value.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.015,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChooseIcon(
                    title: "Camera",
                    onTap: () {
                      controller.getImage(isCamera: true);
                    },
                    icon: Icons.camera_enhance,
                  ),
                  ChooseIcon(
                    title: "Gallery",
                    onTap: () {
                      controller.getImage(isCamera: false);
                    },
                    icon: Icons.image,
                  ),
                ],
              ),
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
                  controller.setProfile();
                },
                child: Text(
                  "Set Profile",
                  style: TextStyle(
                    fontSize: Get.size.height * 0.022,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              MaterialButton(
                height: Get.size.height * 0.06,
                color: Colors.blueAccent,
                minWidth: Get.size.width * 0.7,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.size.height * 0.015),
                ),
                onPressed: () {
                  Get.to(() => FetchImage());
                },
                child: Text(
                  "Fetch Screen",
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

class ProfileAvatar extends StatelessWidget {
  final controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Material(
            color: Colors.grey,
            shape: CircleBorder(),
            child: Container(
              padding: EdgeInsets.all(Get.size.height * 0.003),
              child: Obx(() => CircleAvatar(
                    radius: Get.size.height * 0.09,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: controller.isPicked.value
                        ? FileImage(File(controller.image.value.path))
                        : null,
                  )),
            ),
          ),
          Positioned(
            top: Get.size.height * 0.12,
            right: Get.size.width * 0.3,
            child: Obx(() => Container(
                  padding: EdgeInsets.all(Get.size.height * 0.008),
                  decoration: BoxDecoration(
                    color: controller.isPicked.value
                        ? Colors.green
                        : Colors.grey.shade700,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    controller.isPicked.value
                        ? Icons.check_outlined
                        : Icons.camera_enhance_outlined,
                    color: Colors.white,
                    size: Get.size.height * 0.035,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class ChooseIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ChooseIcon({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.grey.shade300,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () => onTap(),
            splashColor: Colors.grey.shade600,
            child: Container(
              padding: EdgeInsets.all(Get.size.height * 0.012),
              child: Icon(
                icon,
                size: Get.size.height * 0.042,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.size.height * 0.005),
        Text(
          "$title",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Get.size.height * 0.018,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
