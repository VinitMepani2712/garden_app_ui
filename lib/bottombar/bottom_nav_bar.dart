import 'package:flutter/material.dart';
import 'package:garden_app_ui/pages/cart_screen.dart';
import 'package:garden_app_ui/pages/favorite_screen.dart';
import 'package:garden_app_ui/pages/home_screen.dart';
import 'package:garden_app_ui/pages/profile_screen.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late HomeScreen homeScreen;
  late FavoriteScreen favoriteScreen;
  late CartScreen cartScreen;
  late ProfileScreen profileScreen;

  @override
  void initState() {
    super.initState();
    homeScreen = HomeScreen();
    favoriteScreen = FavoriteScreen();
    cartScreen = const CartScreen();
    profileScreen = ProfileScreen(
      name: "",
      location: "",
    );

    pages = [homeScreen, favoriteScreen, cartScreen, profileScreen];
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      return _onItemTapped(2);
    }
    // if (index == 2) {
    //   return _onItemTapped(0);
    // }

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
          borderRadius: BorderRadius.circular(180),
        ),
        backgroundColor: Color(0xff475E3E),
        onPressed: () {},
        child: Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
        ),
      ),
      body: pages[currentTabIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    name: "Vinit",
                                    location: "Surat, Gujarat, India",
                                  )));
                    },
                    child: Icon(Icons.person)),
                label: '',
              ),
            ],
            currentIndex: currentTabIndex,
            selectedItemColor: Color(0xff475E3E),
            unselectedItemColor: Color(0xffD0D5DD),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
