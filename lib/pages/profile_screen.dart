import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  final String? name;
  final String? location;
  final IconData? icon;
  final String? circleAvatarImage;

  ProfileScreen({
    this.name,
    this.location,
    this.icon,
    this.circleAvatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (circleAvatarImage != null)
              CircleAvatar(
                foregroundImage: AssetImage(circleAvatarImage!),
                minRadius: 100,
                maxRadius: 100,
              )
            else
              CircleAvatar(
                minRadius: 100,
                maxRadius: 100,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            SizedBox(height: 20.h),
            if (name != null)
              Container(
                alignment: Alignment.center,
                height: 25.h,
                width: ScreenUtil().setWidth(200),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 210, 210),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Text("Name: $name"),
              ),
            SizedBox(height: 20.h),
            if (location != null)
              Container(
                alignment: Alignment.center,
                height: 25.h,
                width: ScreenUtil().setWidth(200),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 210, 210),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) Icon(icon),
                    Text(location!),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
