import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:astro_scope_draft/constant/icon.dart';
import 'package:astro_scope_draft/screen/home_screen.dart';
import 'package:astro_scope_draft/screen/post_screen.dart';
import 'package:astro_scope_draft/screen/profile_screen.dart';
import 'package:astro_scope_draft/screen/shop_screen.dart';
import 'package:astro_scope_draft/widget/custom_listtile.dart';
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF020131),
        ),
        drawer: Drawer(
        
          backgroundColor: const Color.fromARGB(255, 58, 57, 154),
          child: Padding(
            padding: const EdgeInsets.only(top: 105, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Column(
                    children: [
                      Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(bottom: 22),
                            child: Row(
                              children: [
                                Text(
                                  "Account",
                                  style: TextStyle(
                                    color: Color(0xFFE5E4E4),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomListTile(
                              title: "Account",
                              imagePath: AppIcon.profile1.svg),
                          CustomListTile(
                              title: "Address", imagePath: AppIcon.home.svg),
                          CustomListTile(
                              title: "Notification",
                              imagePath: AppIcon.notification.svg),
                          CustomListTile(
                              title: "Payment Method",
                              imagePath: AppIcon.wallet.svg),
                          CustomListTile(
                              title: "Security",
                              imagePath: AppIcon.password.svg),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(30)),
                SizedBox(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 22),
                        child: Row(
                          children: [
                            Text(
                              "Help",
                              style: TextStyle(
                                color: Color(0xFFE5E4E4),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomListTile(
                          title: "Terms and conditions",
                          imagePath: AppIcon.shield.svg),
                      CustomListTile(
                          title: "Privacy Policy",
                          imagePath: AppIcon.danger.svg),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
