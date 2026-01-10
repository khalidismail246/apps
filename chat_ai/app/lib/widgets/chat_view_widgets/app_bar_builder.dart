import 'package:app/theme/colors_app.dart';
import 'package:app/theme/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar appBarBuilder(BuildContext context) {
  return AppBar(
    elevation: 2,
    shadowColor: Colors.grey,
    backgroundColor: ColorsApp.colorPrimary,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        SvgPicture.asset(
          "assets/images/regular-user-robot.svg",
          width: MediaQuery.of(context).size.width * .08,
        ),
        Column(
          children: [
            Text("Chat AI", style: TextStyleApp.bold24(Colors.white)),
            CustomOnline(),
          ],
        ),
      ],
    ),
  );
}

class CustomOnline extends StatelessWidget {
  const CustomOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CircleAvatar(backgroundColor: Colors.green, radius: 5),
        Text("Online", style: TextStyleApp.bold16(Colors.green)),
      ],
    );
  }
}
