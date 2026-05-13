import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowDataIsEmpty extends StatelessWidget {
  const ShowDataIsEmpty({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyleApp.bold15(ColorsApp.backGroundColor)),
          const SizedBox(height: 10),
          SvgPicture.asset(
            image,
            height: MediaQuery.of(context).size.height * .3,
          ),
        ],
      ),
    );
  }
}
