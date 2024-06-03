import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/category_model.dart';
import 'package:garden_app_ui/pages/notifiction_page.dart';
import 'package:garden_app_ui/pages/plant_deatils_screen.dart';
import 'package:garden_app_ui/pages/profile_screen.dart';
import 'package:garden_app_ui/model/globals.dart';
import 'package:garden_app_ui/provider/favourite_screen_provider.dart';
import 'package:provider/provider.dart';

import '../model/plant_model.dart';
import '../model/plant_details_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProviderScreen favoriteScreenProvider;

  List<bool> isIconClickedList = List.generate(100, (index) => false);

  @override
  void initState() {
    super.initState();
    // filteredPlants = plantsDataDummy;
    favoriteScreenProvider =
        Provider.of<HomeProviderScreen>(context, listen: false);
    favoriteScreenProvider.installDataLoad();

    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     favoriteScreenProvider.installDataLoad();
    //   },
    // );
    // searchController.addListener(_filterPlants);
    _updateFavoriteIconState();
  }

  @override
  void dispose() {
    // searchController.removeListener(_filterPlants);
    super.dispose();
  }

  // void _filterPlants() {
  //   final query = searchController.text.toLowerCase();
  //   final selectedCategory = categories[selectedCategoryIndex];

  //   setState(() {
  //     filteredPlants = plantsDataDummy.where((plant) {
  //       final nameLower = plant.name.toLowerCase();
  //       final matchesName = nameLower.contains(query);
  //       final matchesCategory = selectedCategory == 'All' || plant.category == selectedCategory;
  //       return matchesName && matchesCategory;
  //     }).toList();
  //   });
  // }

  void _updateFavoriteIconState() {
    for (int i = 0; i < plantsDataDummy.length; i++) {
      isIconClickedList[i] = favoritePlants.contains(plantsDataDummy[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeProviderScreen>(
          builder: (context, favoriteScreenProvider, child) {
            return Column(
              children: [
                buildHeader(
                  context: context,
                  profileImagePath: "assets/images/profile.png",
                  welcomeText: "Welcome",
                  userName: "Jona",
                  notificationImagePath:
                      "assets/images/gravity-ui_bell-dot.png",
                  locationText: "Surat, Gujarat, India",
                  locationIcon: Icons.location_on_outlined,
                  locationIconColor: Color(0xff98A2B3),
                  locationTextColor: Color(0xff98A2B3),
                ),
                SizedBox(height: 15.h),
                searchBar(
                    context: context,
                    favoriteScreenProvider: favoriteScreenProvider),
                SizedBox(height: 15.h),
                categoryItems(
                    context: context,
                    favoriteScreenProvider: favoriteScreenProvider),
                SizedBox(height: 15.h),
                cardView(
                    context: context,
                    favoriteScreenProvider: favoriteScreenProvider),
              ],
            );
          },
        ),
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

  Widget searchBar({
    required BuildContext context,
    required HomeProviderScreen favoriteScreenProvider,
  }) {
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
        controller: favoriteScreenProvider.searchController,
        onChanged: (value) {
          favoriteScreenProvider.searchData(value: value);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff98A2B3),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              favoriteScreenProvider.searchController.clear();
              // _filterPlants();
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

  Widget categoryItems({
    required BuildContext context,
    required HomeProviderScreen favoriteScreenProvider,
  }) {
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
            itemCount: favoriteScreenProvider.categories.length,
            itemBuilder: (context, index) {
              return buildCategoryItem(
                  index, favoriteScreenProvider.categories[index],
                  favoriteScreenProvider: favoriteScreenProvider);
            },
          ),
        ),
      ],
    );
  }

  Widget buildCategoryItem(
    int index,
    String categoryName, {
    required HomeProviderScreen favoriteScreenProvider,
  }) {
    return GestureDetector(
      onTap: () => favoriteScreenProvider.updateCatogryData(index: index),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: favoriteScreenProvider.selectedCategoryIndex == index
                ? Color(0xff475E3E)
                : Colors.transparent,
            border: favoriteScreenProvider.selectedCategoryIndex == index
                ? null
                : Border.all(
                    color: Color(0xffD0D5DD),
                  ),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                color: favoriteScreenProvider.selectedCategoryIndex == index
                    ? Colors.white
                    : Color(0xffD0D5DD),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardView(
      {required BuildContext context,
      required HomeProviderScreen favoriteScreenProvider}) {
    return Expanded(
      child: GridView.builder(
        itemCount: favoriteScreenProvider.filteredPlants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        padding: EdgeInsets.all(10.w),
        itemBuilder: (context, index) {
          PlantModel plant = favoriteScreenProvider.filteredPlants[index];
          return buildCard(
            context: context,
            plant: plant,
            index: index,
            favoriteScreenProvider: favoriteScreenProvider,
          );
        },
      ),
    );
  }

  Widget buildCard({
    required BuildContext context,
    required PlantModel plant,
    required int index,
    required HomeProviderScreen favoriteScreenProvider,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDetailsScreen(
            args: PlantDetailsLikeModel(
              plant: plant,
              onFavoriteToggle: (isFavorite) {},
              isFavorite: isIconClickedList[index],
            ),
          ),
        ),
      ),
      child: Card(
        color: const Color.fromARGB(255, 238, 238, 238),
        elevation: 1,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      plant.imagePath,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 10,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(height: 10.0.h),
                Flexible(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          plant.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Container(
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
                ),
              ],
            ),
            Positioned(
              right: 05,
              top: 10,
              child: GestureDetector(
                onTap: () =>
                    favoriteScreenProvider.updateFavoriteData(id: plant.id),
                child: CircleAvatar(
                  maxRadius: 15,
                  minRadius: 15,
                  backgroundColor: Color(0xffB5C9AD),
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: plant.isFavourite
                        ? Colors.red
                        : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 05,
              top: 210,
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
          ],
        ),
      ),
    );
  }
}
