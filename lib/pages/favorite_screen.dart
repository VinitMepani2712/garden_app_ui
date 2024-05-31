import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garden_app_ui/model/globals.dart';
import '../model/category_model.dart';
import '../model/plant_details_model.dart';
import 'plant_deatils_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<bool> isIconClickedList =
      List.generate(favoritePlants.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
      ),
      body: Column(
        children: [
          Expanded(child: buildCard()),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.60,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: favoritePlants.length,
        itemBuilder: (context, index) {
          final plants = favoritePlants[index];
          return buildPlantsCard(plants, index);
        },
      ),
    );
  }

  Widget buildPlantsCard(PlantModel plant, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDetailsScreen(
            args: PlantDetailsLikeModel(
                plant: plant,
                onFavoriteToggle: (isFavorite) {},
                isFavorite: true),
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
              top: 5,
              right: 10,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (!isIconClickedList[index]) {
                      favoritePlants.remove(plant);
                    }
                  });
                },
                child: CircleAvatar(
                  maxRadius: 15,
                  minRadius: 15,
                  backgroundColor: Color(0xffB5C9AD),
                  child: Icon(Icons.favorite, size: 20, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
