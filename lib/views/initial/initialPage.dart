import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profileui/views/profile/profilePage.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Profile Ui Tutorial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
