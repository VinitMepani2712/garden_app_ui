import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/plant_details_model.dart';

import '../model/globals.dart';

class PlantDetailsScreen extends StatefulWidget {
  final PlantDetailsLikeModel args;
  final bool showDescription;

  PlantDetailsScreen({
    required this.args,
    this.showDescription = true,
  });

  @override
  _PlantDetailsScreenState createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  int _counter = 1;
  late bool isFavorite;
  List<bool> isIconClickedList =
      List.generate(favoritePlants.length, (index) => false);
int index = 0;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter > 1 ? _counter-- : null);

  @override
  void initState() {
    super.initState();
    isFavorite = widget.args.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingActionButton(),
      body: Column(
        children: [
          _buildProductImage(index),
          SizedBox(height: 20.h),
          Expanded(child: _buildDetailsCard()),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: MediaQuery.of(context).size.width.w,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(180.r),
        ),
        backgroundColor: Color(0xff475E3E),
        onPressed: () {},
        child: Text("Buy Now", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildProductImage(int index) {
    return Stack(
      children: [
        Image.asset(
          widget.args.plant.imagePath,
          height: MediaQuery.of(context).size.height / 2.h,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0.w, top: 40.0.h, right: 20.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context, isFavorite),
                child: CircleAvatar(
                  backgroundColor: Color(0xffB5C9AD),
                  child: Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    widget.args.onFavoriteToggle(isFavorite);
                    // if (isIconClickedList[index]) {
                    //   favoritePlants.add(plant);
                    // } else {
                    //   favoritePlants.remove(plant);
                    // }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    minRadius: 20,
                    maxRadius: 20,
                    backgroundColor: Color(0xffB5C9AD),
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite
                          ? Colors.red
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsCard() {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 20.w, right: 10.w, bottom: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndCounter(),
              Text(
                '\u{20B9}${widget.args.plant.price}',
                style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              if (widget.showDescription) _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            widget.args.plant.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF0F4EF),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffB5C9AD),
                child: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementCounter,
                ),
              ),
              SizedBox(width: 10.w),
              Text('$_counter', style: TextStyle(fontSize: 20.sp)),
              SizedBox(width: 10.w),
              CircleAvatar(
                backgroundColor: Color(0xffB5C9AD),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: _incrementCounter,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Plant:",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              widget.args.plant.description,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
