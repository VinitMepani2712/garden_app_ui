import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/pages/cart_screen.dart';
import 'package:garden_app_ui/pages/favorite_screen.dart';
import 'package:garden_app_ui/pages/home_screen.dart';
import 'package:garden_app_ui/pages/profile_screen.dart';
import 'package:garden_app_ui/pages/qr_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      FavoriteScreen(),
      CartScreen(),
      ProfileScreen(
        name: "Jona",
        location: "Surat, Gujarat, India",
        icon: Icons.location_on_outlined,
        circleAvatarImage: "assets/images/profile.png",
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(180.w),
        ),
        backgroundColor: Color(0xff475E3E),
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QRScreen(),
          ),
        ),
        child: Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
        ),
      ),
      body: pages[currentTabIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentTabIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.w,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.favorite, 1),
              SizedBox(width: 50.w),
              _buildNavItem(Icons.shopping_cart, 2),
              _buildNavItem(Icons.person, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                currentIndex == index ? Color(0xff475E3E) : Color(0xffD0D5DD),
          ),
          Container(
            height: 4.h,
            width: 4.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? Color(0xff475E3E)
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
