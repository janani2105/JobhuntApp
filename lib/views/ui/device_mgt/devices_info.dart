import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/drawer/drawer_widget.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/device_mgt/widgets/device_info.dart';
import 'package:jobhub/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final zoomNotifier = Provider.of<ZoomNotifier>(context);
    final onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          text: "Device Management",
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacer(
                    size: 50,
                  ),
                  Text(
                    "You are logged into your account on these devices",
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  const HeightSpacer(
                    size: 50,
                  ),
                  DeviceInfo(
                    location: 'Washington DC',
                    device: 'Macbook M2',
                    platform: 'Apple Webkit',
                    ipAddress: '10.0.12.000',
                    date: loginDate,
                  ),
                  const HeightSpacer(
                    size: 50,
                  ),
                  DeviceInfo(
                    location: 'Brooklyn',
                    device: 'IPhone 14',
                    platform: 'Mobile App',
                    ipAddress: '10.0.12.000',
                    date: loginDate,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Consumer<LoginNotifier>(
                builder: (_, model, __) {
                  return GestureDetector(
                    onTap: () {
                      zoomNotifier.currentIndex = 0;
                      onBoardNotifier.isLastPage = false;
                      Get.to(() => OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                          text: "Sign out of all devices",
                          style: appstyle(
                              16, Color(kOrange.value), FontWeight.w600)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
