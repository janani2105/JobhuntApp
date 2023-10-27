import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (context, signupNotifier, child) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: 'Sign up',
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.arrow_left),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                    text: "Hello, Welcome ",
                    style: appstyle(30, Color(kDark.value), FontWeight.w600)),
                ReusableText(
                    text: "Fill the details to signup to your account",
                    style:
                        appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
                const HeightSpacer(size: 50),
                CustomTextField(
                  controller: name,
                  hintText: 'Full Name',
                  keyboardType: TextInputType.emailAddress,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please enter valid Name';
                    } else {
                      return null;
                    }
                  },
                ),
                HeightSpacer(size: 20),
                CustomTextField(
                  controller: email,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || email.contains('@')) {
                      return 'Please enter valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: password,
                  hintText: 'Password',
                  obscureText: signupNotifier.isObsecure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      signupNotifier.isObsecure = !signupNotifier.isObsecure;
                    },
                    child: Icon(
                      signupNotifier.isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(kDark.value),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (password) {
                    if (signupNotifier.passwordValidator(password ?? '')) {
                      return 'Please enter a valid password with atleast one upper case,one lowercase,'
                          'one special character and one digit with minmum 8 character';
                    }
                    return null;
                  },
                ),
                const HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const LoginPage());
                    },
                    child: ReusableText(
                      text: 'Login',
                      style: appstyle(14, Color(kDark.value), FontWeight.w500),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () {},
                  color: Color(kOrange.value),
                )
              ],
            ),
          ));
    });
  }
}
