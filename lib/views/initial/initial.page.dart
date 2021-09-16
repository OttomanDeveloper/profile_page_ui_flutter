import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profileui/views/profile/profile.page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Profile Ui Tutorial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
