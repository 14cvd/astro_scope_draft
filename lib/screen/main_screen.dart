import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:astro_scope_draft/constant/icon.dart';
import 'package:astro_scope_draft/screen/home_screen.dart';
import 'package:astro_scope_draft/screen/post_screen.dart';
import 'package:astro_scope_draft/screen/profile_screen.dart';
import 'package:astro_scope_draft/screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> appIcon = [
    AppIcon.main.svg,
    AppIcon.shop.svg,
    AppIcon.blog.svg,
    AppIcon.profile.svg,
  ];

  List<String> appIconColor = [
    AppIcon.main.svgColor,
    AppIcon.shop.svgColor,
    AppIcon.blog.svgColor,
    AppIcon.profile.svgColor,
  ];

  int indexActive = 0;
  Widget activeWidget = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: activeWidget,
        backgroundColor: const Color(0xFF020131),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {});
            activeWidget = const Center(
                child: Text(
              "Match Screen",
              style: TextStyle(color: Colors.white),
            ));
          },
          child: SvgPicture.asset(AppIcon.match.svg),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: const Color(0xFF070639),
          itemCount: appIcon.length,
          tabBuilder: (index, isActive) {
            return SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                isActive ? appIconColor[index] : appIcon[index],
              ),
            );
          },
          activeIndex: indexActive,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) {
            setState(() {
              indexActive = index;

              switch (index) {
                case 0:
                  activeWidget = const HomeScreen();
                case 1:
                  activeWidget = const ShopScreen();
                case 2:
                  activeWidget = const PostScreen();
                case 3:
                  activeWidget = const ProfileScreen();
              }
            });
          },
        ));
  }
}
