import 'package:flutter/material.dart';
import 'package:garden_app_ui/model/globals.dart';
import '../model/category_model.dart';
import '../model/product_details_model.dart';
import 'plant_deatils_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<bool> isIconClickedList = List.generate(100, (index) => false);

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
          final clothes = favoritePlants[index];
          return buildPlantsCard(clothes, index);
        },
      ),
    );
  }

  Widget buildPlantsCard(PlantModel plant, int index) {
    return GestureDetector(
      // onTap: () async {
      //   final isFavorite = await Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => PlantDetailsScreen(
      //         args: PlantDetailsArguments(
      //             plant: item,
      //             onFavoriteToggle: (isFavorite) {
      //               setState(() {
      //                 isIconClickedList[index] = isFavorite;
      //               });
      //             },
      //             isFavorite: isIconClickedList[index]),
      //       ),
      //     ),
      //   );

      //   if (isFavorite != null) {
      //     setState(() {
      //       isIconClickedList[index] = isFavorite;
      //       if (!isFavorite) {
      //         favoritePlants.remove(item);
      //       }
      //     });
      //   }
      // },

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDetailsScreen(
            args: PlantDetailsArguments(
                plant: plant,
                onFavoriteToggle: (isFavorite) {},
                isFavorite: isIconClickedList[index]),
          ),
        ),
      ),
      child: Card(
        color: Color.fromARGB(255, 223, 235, 219),
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        plant.imagePath,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plant.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '\u{20B9}${plant.price}',
                      style: TextStyle(fontSize: 14, color: Colors.green),
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
      ),
    );
  }
}
