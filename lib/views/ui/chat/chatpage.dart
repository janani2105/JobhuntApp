import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/drawer/drawer_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      child: CustomAppBar(
        text: "Chat",
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: DrawerWidget(),
        ),
      ),
      preferredSize: Size.fromHeight(50.h),
    ));
  }
}