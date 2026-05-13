import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/views/bank_view.dart';
import 'package:flowza/views/borrowed_view.dart';
import 'package:flowza/views/lend_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildNavigationBar extends StatelessWidget {
  const BuildNavigationBar({super.key, required this.selectIndex});
  final int selectIndex;

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, BorrowedView.id);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, LendView.id);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, BankView.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (value) => _onItemTapped(context, value),
          backgroundColor: Colors.grey.withValues(alpha: .4),
          selectedItemColor: ColorsApp.titleColor,
          unselectedItemColor: ColorsApp.backGroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 18,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/borrowed.svg", width: 24),
              label: "Borrowed",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/lend.svg", width: 24),
              label: "Lend",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/bank.svg", width: 24),
              label: "Bank",
            ),
          ],
        ),
      ),
    );
  }
}
