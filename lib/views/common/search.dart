import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: width * 084,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Feather.search,
                color: Color(kOrange.value),
              ),
              ReusableText(
                  text: "Search for jobs",
                  style: appstyle(18, Color(kOrange.value), FontWeight.w500)),
              Icon(
                FontAwesome.sliders,
                color: Color(
                  kDarkGrey.value,
                ),
                size: 20.h,
              ),
            ],
          ),
          HeightSpacer(size: 15),
          Divider(
            color: Color(kDarkGrey.value),
            thickness: 0.5,
            endIndent: 40.w,
          ),
        ],
      ),
    );
  }
}
