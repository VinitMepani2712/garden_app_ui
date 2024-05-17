import 'package:flutter/material.dart';
import 'package:garden_app_ui/bottombar/bottom_nav_bar.dart';
import 'package:garden_app_ui/pages/home_screen.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          splashImage(context),
          SizedBox(
            height: 20,
          ),
          title(),
          SizedBox(
            height: 20,
          ),
          myButton(context),
        ],
      ),
    );
  }

  Widget splashImage(BuildContext context) {
    return ShapeOfView(
      shape: ArcShape(
        direction: ArcDirection.Outside,
        height: 20,
        position: ArcPosition.Bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 243, 243),
        ),
        child: Image.asset("assets/images/unsplash_plant.png"),
      ),
    );
  }

  Widget title() {
    return Text(
      "Create Your\n Own Garden!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget myButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavBarPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xff475E3E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Let's Start",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
