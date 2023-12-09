import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../main.dart';
import '../view/Categories_Page.dart';
import '../view/HomePage.dart';
import '../view/Profile_page.dart';
import '../view/fanorites_page.dart';
import '../view/profile_details.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  bool isPressed = true;
  int _currentIndex = 0;
  final List _navScreens = [
    const MainHomeScreen(),
    const CategoriesPage(),
    const WishlistScreen(),
    userToken == null ? const ProfileScreen() : const ProfileDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(160.0),
              topRight: Radius.circular(160.0)),
        ),
        child: GNav(
            selectedIndex: _currentIndex,
            gap: 8,
            backgroundColor: const Color(0xffF6F6F6),
            color: const Color.fromRGBO(10, 207, 131, 1),
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(16),
            onTabChange: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            tabs: [
              GButton(
                icon: isPressed ? Icons.home_outlined : Icons.home,
                text: "Home",
                onPressed: () {},
              ),
              GButton(
                  icon: isPressed
                      ? Icons.category_outlined
                      : FontAwesomeIcons.cartShopping,
                  text: "Categories"),
              GButton(
                  icon: isPressed ? Icons.favorite_border : Icons.favorite,
                  text: "Wishlist"),
              GButton(
                  icon: isPressed ? Icons.person_outlined : Icons.person,
                  text: "Profile"),
            ]),
      ),
      body: _navScreens.elementAt(_currentIndex),
    );
  }
}
