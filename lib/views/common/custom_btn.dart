import 'package:flutter/material.dart';
import 'package:jobhub/views/common/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color});
  final String text;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          color: Color(kOrange.value),
          width: width,
          height: hieght * 0.065,
          child: Center(
            child: ReusableText(
              text: text,
              style: appstyle(
                  16, Colors.white ?? Color(kLight.value), FontWeight.w600),
            ),
          ),
        ));
  }
}
