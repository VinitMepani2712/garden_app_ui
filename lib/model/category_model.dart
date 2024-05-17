class Plant {
  final String imagePath;
  final String name;
  final String price;
  final String description;
  final String category;

  Plant({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  });
}

List<Plant> plants = [
  Plant(
    imagePath: 'assets/images/1.png',
    name: 'Indoor',
    price: '200',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Indoor',
  ),
  Plant(
    imagePath: 'assets/images/2.png',
    name: 'Outdoor',
    price: '150',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Outdoor',
  ),
  Plant(
    imagePath: 'assets/images/3.png',
    name: 'Indoor',
    price: '200',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Indoor',
  ),
  Plant(
    imagePath: 'assets/images/4.png',
    name: 'Outdoor',
    price: '150',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Outdoor',
  ),
  Plant(
    imagePath: 'assets/images/2.png',
    name: 'Thallophyta',
    price: '200',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Thallophyta',
  ),
  Plant(
    imagePath: 'assets/images/1.png',
    name: 'Bryophyta',
    price: '150',
    description:
        'I use the word perennial for the herbaceous perennials on this website. An herbaceous perennial is a plant that lives for more than two years and has soft, green stems (not woody). Most perennials die back to the ground every winter in colder climates to newly emerge in spring, but there are also evergreen perennials. So when I use the word perennial I mean herbaceous perennial. A plant can behave as a perennial or an annual depending on the local climate and geographic growing conditions.',
    category: 'Bryophyta',
  ),
];

List<Plant> getPlantsByCategory(String category) {
  if (category == 'All') {
    return plants;
  }
  return plants.where((plant) => plant.category == category).toList();
}
