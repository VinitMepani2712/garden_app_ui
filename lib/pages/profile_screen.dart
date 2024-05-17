import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String location;

  ProfileScreen({required this.name, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffF0F4EF),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name'),
              Text('Location: $location'),
            ],
          ),
        ),
      ),
    );
  }
}
