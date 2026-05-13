import 'package:flowza/theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget buildAppBar() {
  return AppBar(
    elevation: 2,
    shadowColor: ColorsApp.appColor,

    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        SvgPicture.asset(
          "assets/images/logo.svg",
          colorFilter: ColorFilter.mode(
            ColorsApp.backGroundColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          "Flowza",
          style: TextStyle(
            color: ColorsApp.backGroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "PlayfairDisplay",
          ),
        ),
      ],
    ),
  );
}
