import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/category_model.dart';
import 'package:garden_app_ui/pages/notifiction_page.dart';
import 'package:garden_app_ui/pages/plant_deatils_screen.dart';
import 'package:garden_app_ui/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isIconClickedList = List.generate(100, (index) => false);
  List<bool> isCategoryClicked = [true, false, false, false, false];
  int selectedCategoryIndex = 0;

  final categories = ['All', 'Indoor', 'Outdoor', 'Thallophyta', 'Bryophyta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          topBar(),
          location(),
          SizedBox(height: 15.h),
          searchBar(context),
          SizedBox(height: 15.h),
          categoryItems(context),
          SizedBox(height: 15.h),
          cardView(context),
        ]),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget topBar() {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: AssetImage("assets/images/2.png"),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff98A2B3),
                ),
              ),
              Text(
                "Vinit",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344054),
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            child: CircleAvatar(
              backgroundColor: Color(0xff28282833),
              child: Image.asset("assets/images/gravity-ui_bell-dot.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget location() {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Color(0xff98A2B3),
          ),
          Text(
            "Surat, Gujarat, India",
            style: TextStyle(
              fontSize: 14.sp,
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
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xffF2F4F7),
      ),
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
          hintStyle: TextStyle(fontSize: 15.sp, color: Color(0xff98A2B3)),
        ),
      ),
    );
  }

  Widget categoryItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 42.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildCategoryItem(index, categories[index]);
              },
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
            } else {
              isCategoryClicked[i] = false;
            }
          }
          selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget cardView(BuildContext context) {
    String selectedCategory = categories[selectedCategoryIndex];
    List<Plant> filteredPlants = getPlantsByCategory(selectedCategory);

    return Expanded(
      child: GridView.builder(
        itemCount: filteredPlants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        padding: EdgeInsets.all(10.w),
        itemBuilder: (context, index) {
          Plant plant = filteredPlants[index];
          return buildCard(
            context,
            plant,
            index,
          );
        },
      ),
    );
  }

  Widget buildCard(BuildContext context, Plant plant, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailScreen(
              plant: plant,
            ),
          ),
        );
      },
      child: Container(
        height: 400.h,
        padding: EdgeInsets.only(left: 8.0, right: 20.0),
        decoration: BoxDecoration(
          color: Color(0xffF0F4EF),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -10,
              top: 10,
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
            Positioned(
              right: -10,
              top: 165,
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
                    Icons.add,
                    size: 20,
                    color: isIconClickedList[index]
                        ? Colors.red
                        : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.0,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      plant.imagePath,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  plant.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF)),
                  child: Text(
                    '\u{20B9} ${plant.price}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
