import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/category_model.dart';

class PlantDetailScreen extends StatefulWidget {
  final PlantModel plant;
  final bool showDescription;

  PlantDetailScreen({required this.plant, this.showDescription = true});

  @override
  _PlantDetailScreenState createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  int _counter = 1;
  bool isIconClicked = false;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter > 1 ? _counter-- : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 325.w,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(180.r),
          ),
          backgroundColor: Color(0xff475E3E),
          onPressed: () {},
          child: Text("Buy Now", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffB5C9AD),
                          child: Icon(Icons.arrow_back_ios_new_outlined,
                              color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            setState(() => isIconClicked = !isIconClicked),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffB5C9AD),
                          child: Icon(
                            Icons.favorite,
                            color: isIconClicked
                                ? Colors.red
                                : Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  widget.plant.imagePath,
                  height: MediaQuery.of(context).size.height * 0.4.h,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 05.w),
                child: Material(
                  elevation: 10,
                  type: MaterialType.card,
                  borderRadius: BorderRadius.circular(10.r),
                  shadowColor: Color.fromARGB(255, 160, 160, 160),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, left: 20.w, right: 10.w, bottom: 80.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.plant.name,
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF0F4EF),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffB5C9AD),
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: _decrementCounter,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text('$_counter',
                                      style: TextStyle(fontSize: 20.sp)),
                                  SizedBox(width: 10.w),
                                  CircleAvatar(
                                    backgroundColor: Color(0xffB5C9AD),
                                    child: IconButton(
                                      icon:
                                          Icon(Icons.add, color: Colors.white),
                                      onPressed: _incrementCounter,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Price: ${widget.plant.price}',
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 20.h),
                        if (widget.showDescription) ...[
                          Text(
                            "About Plant:",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            widget.plant.description,
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
