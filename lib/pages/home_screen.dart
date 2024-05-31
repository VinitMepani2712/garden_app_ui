import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/category_model.dart';
import 'package:garden_app_ui/pages/notifiction_page.dart';
import 'package:garden_app_ui/pages/plant_deatils_screen.dart';
import 'package:garden_app_ui/pages/profile_screen.dart';
import 'package:garden_app_ui/model/globals.dart';

import '../model/plant_model.dart';
import '../model/product_details_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isIconClickedList = List.generate(100, (index) => false);
  List<bool> isCategoryClicked = [true, false, false, false, false];
  int selectedCategoryIndex = 0;

  final categories = ['All', 'Indoor', 'Outdoor', 'Thallophyta', 'Bryophyta'];

  TextEditingController searchController = TextEditingController();
  List<PlantModel> filteredPlants = [];

  @override
  void initState() {
    super.initState();
    filteredPlants = plants;
    searchController.addListener(_filterPlants);
    _updateFavoriteIconState();
  }

  @override
  void dispose() {
    searchController.removeListener(_filterPlants);
    searchController.dispose();
    super.dispose();
  }

  void _filterPlants() {
    final query = searchController.text.toLowerCase();
    final selectedCategory = categories[selectedCategoryIndex];

    setState(() {
      filteredPlants = plants.where((plant) {
        final nameLower = plant.name.toLowerCase();
        final matchesName = nameLower.contains(query);
        final matchesCategory =
            selectedCategory == 'All' || plant.category == selectedCategory;
        return matchesName && matchesCategory;
      }).toList();
    });
  }

  void _updateFavoriteIconState() {
    for (int i = 0; i < plants.length; i++) {
      isIconClickedList[i] = favoritePlants.contains(plants[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          buildHeader(
            context: context,
            profileImagePath: "assets/images/profile.png",
            welcomeText: "Welcome",
            userName: "Jona",
            notificationImagePath: "assets/images/gravity-ui_bell-dot.png",
            locationText: "Surat, Gujarat, India",
            locationIcon: Icons.location_on_outlined,
            locationIconColor: Color(0xff98A2B3),
            locationTextColor: Color(0xff98A2B3),
          ),
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

  Widget buildHeader({
    required BuildContext context,
    required String profileImagePath,
    required String welcomeText,
    required String userName,
    String? notificationImagePath,
    required String locationText,
    required IconData locationIcon,
    required Color locationIconColor,
    required Color locationTextColor,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      name: userName,
                      icon: locationIcon,
                      circleAvatarImage: profileImagePath,
                      location: locationText,
                    ),
                  ),
                ),
                child: CircleAvatar(
                  foregroundImage: AssetImage(profileImagePath),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    welcomeText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff98A2B3),
                    ),
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff344054),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xff28282833),
                  child: Image.asset(notificationImagePath!),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(
                location: locationText,
                icon: locationIcon,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Row(
              children: [
                Icon(
                  locationIcon,
                  color: locationIconColor,
                ),
                SizedBox(width: 8.w),
                Text(
                  locationText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: locationTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget searchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xffF2F4F7),
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff98A2B3),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              searchController.clear();
              _filterPlants();
            },
            child: Icon(
              Icons.highlight_remove,
              color: Color(0xff98A2B3),
            ),
          ),
          border: InputBorder.none,
          fillColor: Color(0xffF2F4F7),
          filled: true,
          hintText: "Search here",
          hintStyle: TextStyle(fontSize: 16.sp, color: Color(0xff98A2B3)),
        ),
      ),
    );
  }

  Widget categoryItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
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
    );
  }

  Widget buildCategoryItem(int index, String categoryName) {
    return GestureDetector(
      onTap: () => setState(() {
        for (int i = 0; i < isCategoryClicked.length; i++) {
          if (i == index) {
            isCategoryClicked[i] = true;
          } else {
            isCategoryClicked[i] = false;
          }
        }
        selectedCategoryIndex = index;
        _filterPlants();
      }),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: isCategoryClicked[index]
                ? Color(0xff475E3E)
                : Colors.transparent,
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
      ),
    );
  }

  Widget cardView(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: filteredPlants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
        ),
        padding: EdgeInsets.all(10.w),
        itemBuilder: (context, index) {
          PlantModel plant = filteredPlants[index];
          return buildCard(
            context,
            plant,
            index,
          );
        },
      ),
    );
  }

  Widget buildCard(BuildContext context, PlantModel plant, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDetailsScreen(
            args: PlantDetailsLikeModel(
                plant: plant,
                onFavoriteToggle: (isFavorite) {},
                isFavorite: isIconClickedList[index]),
          ),
        ),
      ),
      child: Container(
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
                    if (isIconClickedList[index]) {
                      favoritePlants.add(plant);
                    } else {
                      favoritePlants.remove(plant);
                    }
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
              top: 190,
              child: CircleAvatar(
                maxRadius: 15,
                minRadius: 15,
                backgroundColor: Color(0xffB5C9AD),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              height: 200.0.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      plant.imagePath,
                      height: 130.h,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Flexible(
                    child: Wrap(
                      children: [
                        Text(
                          plant.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0.h),
                  Container(
                    alignment: Alignment.center,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Text(
                      '\u{20B9} ${plant.price}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
