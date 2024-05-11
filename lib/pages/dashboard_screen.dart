import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garden_app_ui/pages/card_data.dart';
import 'package:garden_app_ui/pages/plant_deatils.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<bool> isIconClickedList = List.generate(4, (index) => false);
  List<bool> isCategoryClicked = [false, false, false, false, false];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
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
      ),
      body: SafeArea(
        child: Column(children: [
          topBar(),
          location(),
          SizedBox(
            height: 15,
          ),
          searchBar(context),
          SizedBox(
            height: 15,
          ),
          categoryItems(context),
          SizedBox(
            height: 15,
          ),
          cardView(context),
          bottomNavBar(),
        ]),
      ),
    );
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff98A2B3),
                ),
              ),
              Text(
                "Vinit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344054),
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Color(0xff28282833),
            child: Image.asset("assets/images/gravity-ui_bell-dot.png"),
          ),
        ],
      ),
    );
  }

  Widget location() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Color(0xff98A2B3),
          ),
          Text(
            "Surat, Gujarat, India",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff98A2B3),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffF2F4F7)),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff98A2B3),
            ),
            suffixIcon: Icon(
              Icons.settings_input_component_outlined,
              color: Color(0xff98A2B3),
            ),
            border: InputBorder.none,
            fillColor: Color(0xffF2F4F7),
            filled: true,
            hintText: "Search here",
            hintStyle: TextStyle(fontSize: 15, color: Color(0xff98A2B3))),
      ),
    );
  }

  Widget categoryItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCategoryItem(0, "All"),
                buildCategoryItem(1, "Indoor"),
                buildCategoryItem(2, "Outdoor"),
                buildCategoryItem(3, "Thallophyta"),
                buildCategoryItem(4, "Bryophyta"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(int index, String categoryName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < isCategoryClicked.length; i++) {
            if (i == index) {
              isCategoryClicked[i] = true;
              selectedCategoryIndex = index;
            } else {
              isCategoryClicked[i] = false;
            }
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 0 : 10),
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isCategoryClicked[index] ? Color(0xff475E3E) : Colors.transparent,
          border: isCategoryClicked[index]
              ? null
              : Border.all(color: Color(0xffD0D5DD)),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              color:
                  isCategoryClicked[index] ? Colors.white : Color(0xffD0D5DD),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget cardView(BuildContext context) {
    List<Map<String, String>> filteredCards = [];

    if (selectedCategoryIndex == 0) {
      filteredCards = allCards;
    } else if (selectedCategoryIndex == 1) {
      filteredCards = indoorCards;
    } else if (selectedCategoryIndex == 2) {
      filteredCards = outdoorCards;
    } else if (selectedCategoryIndex == 3) {
      filteredCards = thallophytaCards;
    } else if (selectedCategoryIndex == 4) {
      filteredCards = bryophytaCards;
    }

    return Expanded(
      child: GridView.count(
        childAspectRatio: 0.75,
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(filteredCards.length, (index) {
          return buildCard(
            context,
            allCards.indexOf(filteredCards[index]),
            filteredCards[index]["imagePath"]!,
            filteredCards[index]["name"]!,
            filteredCards[index]["price"]!,
            filteredCards[index]["description"]!,
          );
        }),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index, String imagePath,
      String name, String price, String description) {
    if (selectedCategoryIndex == 0 || selectedCategoryIndex == index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlantDetailPage(
                imagePath: imagePath,
                plantName: name,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffF0F4EF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isIconClickedList[index] = !isIconClickedList[index];
                    });
                  },
                  child: CircleAvatar(
                    maxRadius: 15,
                    minRadius: 15,
                    backgroundColor: Color(0xffB5C9AD),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: isIconClickedList[index]
                          ? Colors.red
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    imagePath,
                    height: 140,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '\u{20B9} $price',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff475E3E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Color(0xffB5C9AD),
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      // Return an empty container if the item doesn't match the selected category
      return Container();
    }
  }

  Widget bottomNavBar() {
    return SizedBox(
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              color: Colors.grey,
              Icons.home,
              semanticLabel: "Home",
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: Icon(
              color: Colors.grey,
              Icons.favorite,
              semanticLabel: "Favourite",
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: Colors.transparent,
              semanticLabel: "",
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(
              color: Colors.grey,
              Icons.shopping_cart,
              semanticLabel: "Cart",
            ),
          ),
          BottomNavigationBarItem(
            label: "Person",
            icon: Icon(
              Icons.person,
              color: Colors.grey,
              semanticLabel: "Person",
            ),
          ),
        ],
      ),
    );
  }
}
