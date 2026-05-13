import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/views/borrowed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});
  static const String id = "/splach";

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        BorrowedView.id,
        (route) => false,
      );
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor.withValues(),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              SizedBox(height: 15),
              Text("Flowza", style: TextStyleApp.bold40(ColorsApp.textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
