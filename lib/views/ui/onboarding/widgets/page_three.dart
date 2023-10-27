import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            HeightSpacer(size: 15),
            ReusableText(
                text: "Welcome to JobHub",
                style: appstyle(30, Color(kLight.value), FontWeight.w600)),
            HeightSpacer(size: 15),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "We help you  find your dream job according to your  skillset, location and preference to build your career",
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kLight.value), FontWeight.normal),
              ),
            ),
            HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => LoginPage());
                  },
                  child: CustomOutlineBtn(
                    text: "Login",
                    width: width * 0.4,
                    height: hieght * 0.06,
                    color: kLight,
                    color2: null,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   Get.to(()=>RegistrationPage());
                  },
                  child: Container(
                    width: width * 0.4,
                    height: hieght * 0.06,
                    color: Color(kLight.value),
                    child: Center(
                      child: ReusableText(
                        text: "Sign up",
                        style: appstyle(16, kLightBlue, FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
            HeightSpacer(size: 15),
            ReusableText(
                text: "Continue as Guest",
                style: appstyle(16, Color(kLight.value), FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
