import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/product_details_model.dart';

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
                      CircleAvatar(
                        backgroundColor: Color(0xffB5C9AD),
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite
                              ? Colors.red
                              : Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  widget.args.plant.imagePath,
                  height: MediaQuery.of(context).size.height / 2.h,
                  width: MediaQuery.of(context).size.width / 1.3.w,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              color: Colors.white,
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.h, left: 20.w, right: 10.w, bottom: 80.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.args.plant.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
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
                                Text('$_counter',
                                    style: TextStyle(fontSize: 20.sp)),
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
                      ),
                      Text(
                        '\u{20B9}${widget.args.plant.price}',
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
                          widget.args.plant.description,
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
          ],
        ),
      ),
    );
  }
}
