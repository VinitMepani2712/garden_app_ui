import 'package:flutter/material.dart';
import 'package:garden_app_ui/model/category_model.dart';

class PlantDetailScreen extends StatefulWidget {
  final Plant plant;
  final bool showDescription;

  PlantDetailScreen({required this.plant, this.showDescription = true});

  @override
  _PlantDetailScreenState createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
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
      floatingActionButton: Container(
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
                  widget.plant.imagePath,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 05),
                child: Material(
                  elevation: 10,
                  type: MaterialType.card,
                  borderRadius: BorderRadius.circular(10),
                  shadowColor: Color.fromARGB(255, 160, 160, 160),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 10, bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.plant.name,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20),
                        if (widget.showDescription)
                          Text(
                            "About Plant:",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        if (widget.showDescription)
                          Text(
                            widget.plant.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
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
