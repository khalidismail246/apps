import 'package:app/theme/text_style_app.dart';
import 'package:app/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String id = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, ChatView.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.pinkAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/chores_and_allowance_bot.svg",
                width: MediaQuery.of(context).size.width * .5,
              ),
              Text("Chat AI", style: TextStyleApp.bold40(Colors.white)),
              Text("Ask For Help 🤍", style: TextStyleApp.bold20(Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
