import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlantDetailPage extends StatefulWidget {
  final String imagePath;
  final String plantName;
  final String price;
  final String description;

  PlantDetailPage({
    required this.imagePath,
    required this.plantName,
    required this.price,
    required this.description,
  });

  @override
  _PlantDetailPageState createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  int _counter = 1;
  bool isIconClicked = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: 325,
          child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180),
              ),
              backgroundColor: Color(0xff475E3E),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xffB5C9AD),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIconClicked = !isIconClicked;
                          });
                        },
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
                  widget.imagePath,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.plantName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF0F4EF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffB5C9AD),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                ),
                                onPressed: _decrementCounter,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
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
                    'Price: ${widget.price}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "About Plant:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${widget.description}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 05,
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 20),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(
                  //         Color(0xff475E3E),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       "Buy Now!",
                  //       style: TextStyle(color: Color(0xffF0F4EF)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
